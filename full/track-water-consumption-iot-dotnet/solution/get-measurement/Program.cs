using System.Device.I2c;
using System.Numerics;
using System.Text;
using Iot.Device.Ft4222;
using Iot.Device.Hx711;
using Iot.Device.Lis3DhAccelerometer;
using UnitsNet;

List<Ft4222Device> ft4222s = Ft4222Device.GetFt4222();
if (ft4222s.Count == 0)
{
    Console.WriteLine("FT4222 not plugged in");
    return;
}

Ft4222Device ft4222 = ft4222s[0];

I2cDevice acceremoterI2cDevice = ft4222.CreateI2cDevice(new I2cConnectionSettings(0, Lis3Dh.DefaultI2cAddress));
I2cDevice weightSensorI2cDevice = ft4222.CreateI2cDevice(new I2cConnectionSettings(0, Hx711I2c.DefaultI2cAddress));

using Hx711I2c weightSensor = new(weightSensorI2cDevice);
weightSensor.CalibrationScale = 2236.0f;
// For faster sampling, we will sacrifice some accuracy
weightSensor.SampleAveraging = 5;
weightSensor.Tare(blinkLed: true);

using var accelerometer = Lis3Dh.Create(acceremoterI2cDevice, dataRate: DataRate.DataRate100Hz);

StringBuilder sb = new();

Console.WriteLine("Start typing label when you're done (i.e. drinking)");
string labels = "date,time,weight[g],accX,accY,accZ";
sb.AppendLine(labels);
Console.WriteLine(labels);

while (!Console.KeyAvailable)
{
    Vector3 acceleration = accelerometer.Acceleration;
    Mass weight = weightSensor.GetWeight();
    string data = $"{DateTime.Now.ToString("yyyy-MM-dd,hh:mm:ss:fff")},{weight.Grams:0.0},{acceleration.X:0.0},{acceleration.Y:0.0},{acceleration.Z:0.0}";
    sb.AppendLine(data);
    Console.WriteLine(data);
}

DateTime now = DateTime.Now;
string label = Console.ReadLine()!;
string fileName = now.ToString("yyyy-MM-dd-hh-mm-ss-fff") + "-" + label + ".txt";

const string directory = "measurements";
Directory.CreateDirectory(directory);

File.WriteAllText(Path.Combine(directory, fileName), sb.ToString());
