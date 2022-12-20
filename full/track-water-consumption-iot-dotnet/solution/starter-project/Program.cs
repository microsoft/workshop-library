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
weightSensor.Tare(blinkLed: true);

using var accelerometer = Lis3Dh.Create(acceremoterI2cDevice, dataRate: DataRate.DataRate100Hz);

// To read acceleration:
// Vector3 acceleration = accelerometer.Acceleration;

// To read weight:
// Mass weight = weightSensor.GetWeight();
// weight.Grams to access gram value
