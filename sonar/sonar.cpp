#line 1 "sonar.ino"
// Sonar Pins
#include "Arduino.h"
void setup();
void loop();
int sonar();
#line 2
const int trigPin   = 2;
const int echoPin   = 4;

void setup() {
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  pinMode(trigPin, OUTPUT);
}

void loop() {
	sonar();
}

int sonar(){
  // establish variables for duration of the ping, 
  // and the distance result in centimeters:
  int duration, centimeters;

  // The sensor is triggered by a HIGH pulse of 10 or more microseconds.
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Read the signal from the sensor: a HIGH pulse whose
  // duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);

  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  centimeters = duration / 29 / 2;

  return centimeters;
}

