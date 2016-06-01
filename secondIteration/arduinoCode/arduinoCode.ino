
//  Dimmer created 2006 by David A. Mellis, modified 30 Aug 2011 by Tom Igoe and Scott Fitzgerald
#include <Servo.h> 

Servo myservo;
const int pArm = 11;      // the pin that the LED is attached to
int pos;

void setup()
{
  Serial.begin(9600);
  myservo.attach(9);  
}

void loop() {

  if (Serial.available()) {
    pos = Serial.read();
  }
  int val = map(pos, 0,100, 0,160);
  myservo.write(val);
}



