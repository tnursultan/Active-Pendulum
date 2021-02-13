// 28
int sensorPin = A0;
int motorPin = 13;
double sensorValue = 0;
double setPoint = 3.3;
double Kp = 50;
double error = 0;
double output = 0;

//24
void setup() {
  pinMode(sensorPin, INPUT);
  pinMode(motorPin, OUTPUT);
}

void loop() { // 10
  sensorValue = analogRead(sensorPin); // 4 + 5
  error = setPoint - sensorValue; // 4- 18
  output = error * Kp; // 4 + 18
  analogWrite(motorPin, output); // 6
  delay(50); // 3
}

// total execution time = 124ms
