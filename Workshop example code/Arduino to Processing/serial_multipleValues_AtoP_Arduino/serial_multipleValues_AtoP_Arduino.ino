// IMA NYU Shanghai
// Interaction Lab

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
}

void loop() {
  int sensor1 = analogRead(A0)/4;
  int sensor2 = analogRead(A1)/4;
  int button = digitalRead(2);

  Serial.print(sensor1);
  Serial.print(",");  // put comma between sensor values
  Serial.print(sensor2);
  Serial.print(",");
  Serial.print(button);
  Serial.println(); // add linefeed after sending the last sensor value

  // too fast communication might cause some latency in Processing
  // this delay resolves the issue.
  delay(100);
}
