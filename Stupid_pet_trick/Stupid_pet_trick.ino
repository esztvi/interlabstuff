
const int sensorPin = A0;
// room temperature in Celsius
const float baselineTemp = -27.0;
int pinNumber = 9;
int pinNumbera = 10;
int pinNumberb = 11;
#include <Servo.h>
int val = 0;
int angle = 100;
Servo servo;

void setup() {
  // open a serial connection to display values
  Serial.begin(9600);
  // set the LED pins as outputs
  // the for() loop saves some extra coding
  for (int pinNumber = 9; pinNumber < 12; pinNumber++) {
    pinMode(pinNumber, OUTPUT);
    digitalWrite(pinNumber, LOW);
  }
  servo.attach(6);
}

void loop() {
  // read the value on AnalogIn pin 0 and store it in a variable
  int sensorVal = analogRead(sensorPin);

  // send the 10-bit sensor value out the serial port
  Serial.print("sensor Value: ");
  Serial.print(sensorVal);

  // convert the ADC reading to voltage
  float voltage = (sensorVal / 1024.0) * 5.0;

  // Send the voltage level out the Serial port
  Serial.print(", Volts: ");
  Serial.print(voltage);

  // convert the voltage to temperature in degrees C
  // the sensor changes 10 mV per degree
  // the datasheet says there's a 500 mV offset
  // ((voltage - 500 mV) times 100)
  Serial.print(", degrees C: ");
  float temperature = (voltage - .5) * 100;
  Serial.println(temperature);

  // if the current temperature is lower than the baseline turn off all LEDs
  if (temperature < baselineTemp + 1) {
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, LOW);
  } // if the temperature rises 1-2 degrees, turn an LED on
  else if (temperature >= baselineTemp + 1 && temperature < baselineTemp + 2) {
    digitalWrite(9, HIGH);
    digitalWrite(10, LOW);
    digitalWrite(11, LOW);
  } // if the temperature rises 2-3 degrees, turn a second LED on
  else if (temperature >= baselineTemp + 2 && temperature < baselineTemp + 3) {
    digitalWrite(9, HIGH);
    digitalWrite(10, HIGH);
    digitalWrite(11, LOW);
  } // if the temperature rises more than 3 degrees, turn all LEDs on
  else if (temperature >= baselineTemp + 3) {
    digitalWrite(9, HIGH);
    digitalWrite(10, HIGH);
    digitalWrite(11, HIGH);
  val = analogRead(A5);
  angle = map(val, 0, 1023, 0, 180);
  servo.write(angle);

  }
  delay(100);
}
