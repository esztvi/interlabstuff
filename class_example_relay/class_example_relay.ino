int buttonPin = 3;
int relayPin = 2;
int buttonState = 0;

void setup() {
  // put your setup code here, to run once:
pinMode(buttonPin, INPUT);
pinMode(relayPin, OUTPUT);
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
buttonState = digitalRead(buttonPin);
Serial.println(buttonState);
if(buttonState == HIGH) {
  digitalWrite(relayPin, HIGH);
} else{
  digitalWrite(relayPin, LOW);
}
}
