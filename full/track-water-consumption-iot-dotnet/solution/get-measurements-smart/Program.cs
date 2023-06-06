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
weightSensor.SampleAveraging = 5;
weightSensor.Tare(blinkLed: true);

using var accelerometer = Lis3Dh.Create(acceremoterI2cDevice, dataRate: DataRate.DataRate100Hz);

Console.WriteLine("Press any key to stop... You should see actions here:");

List<(DateTime, Mass, Vector3)> actionMeasurements = new();

bool actionInProgress = false;
DateTime lastTimestamp = DateTime.Now;
Mass lastWeight = weightSensor.GetWeight();
Vector3 lastAcceleration = accelerometer.Acceleration;

const double gramsDifferenceThreshold = 3;
const float accelerationDistanceThreshold = 0.3f;
const double inactivityMillisecondsThreshold = 2000.0;

while (!Console.KeyAvailable)
{
    DateTime timestamp = DateTime.Now;
    Vector3 acceleration = accelerometer.Acceleration;
    Mass weight = weightSensor.GetWeight();

    bool movementHappened =
        MassChanged(weight, lastWeight)
        || Vector3.Distance(lastAcceleration, acceleration) >= accelerationDistanceThreshold;

    if (actionInProgress)
    {
        if (!movementHappened
            && timestamp.Subtract(lastTimestamp).TotalMilliseconds >= inactivityMillisecondsThreshold
            && IsBottleStraight(acceleration))
        {
            actionInProgress = false;
            ActionDetected(actionMeasurements);
            actionMeasurements.Clear();
        }
    }
    else if (movementHappened)
    {
        actionInProgress = true;

        // we add last stable measurement
        actionMeasurements.Add((lastTimestamp, lastWeight, lastAcceleration));
    }

    if (movementHappened)
    {
        lastTimestamp = timestamp;
        lastWeight = weight;
        lastAcceleration = acceleration;
    }

    if (actionInProgress)
    {
        actionMeasurements.Add((timestamp, weight, acceleration));
    }
}

void ActionDetected(List<(DateTime, Mass, Vector3)> actionMeasurements)
{
    (DateTime firstTimestamp, Mass firstMass, Vector3 firstAcceleration) = actionMeasurements[0];
    (DateTime lastTimestamp, Mass lastMass, Vector3 lastAcceleration) = actionMeasurements[actionMeasurements.Count - 1];

    double durationSeconds = (lastTimestamp - firstTimestamp).TotalSeconds;
    var zValues = actionMeasurements.Select(measurement => measurement.Item3.Z);
    float zRange = zValues.Max() - zValues.Min();

    string extraInfo = $" Action lasted {durationSeconds:0.0} seconds. Z range: {zRange:0.0}";

    if (MassChanged(firstMass, lastMass))
    {
        double massDifferenceGrams = firstMass.Grams - lastMass.Grams;

        if (massDifferenceGrams > 0)
        {
            Console.Write($"You have drinked {massDifferenceGrams:0} grams of water.");
        }
        else
        {
            Console.Write($"You have reffilled {-massDifferenceGrams:0} grams of water.");
        }
    }
    else
    {
        Console.Write("You have moved the bottle.");
    }

    Console.WriteLine(extraInfo);
}

bool MassChanged(Mass start, Mass end)
{
    return Math.Abs(start.Grams - end.Grams) >= gramsDifferenceThreshold;
}

bool IsBottleStraight(Vector3 acceleration)
{
    return Math.Abs(acceleration.Z - 1.0f) <= accelerationDistanceThreshold;
}