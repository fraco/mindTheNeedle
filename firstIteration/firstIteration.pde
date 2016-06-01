
//Library by Andreas Borg: Thinkgear http://crea.tion.to/processing/thinkgear-java-socket
//Dimmer Serialed, Arduino's example by David A. Mellis (modified by Tom Igoe and Scott Fitzgerald)
import neurosky.*;
import org.json.*;
import processing.serial.*;

ThinkGearSocket neuroSocket;
Serial port;

Revolutions UIprogress;
Wireframe Wirefr;


int serialSignal;

PFont font;

float slash;

void setup() {
  size(screenWidth, screenHeight);

  ThinkGearSocket neuroSocket = new ThinkGearSocket(this);
  try {
    neuroSocket.start();
  } 
  catch (ConnectException e) {
    //println("Is ThinkGear running??");
  }
  //text
  font = createFont("GillSans-Light-48.vlw", 24);
  textFont(font);
  //GUI class
  UIprogress = new Revolutions();
  Wirefr = new Wireframe(); 

  //serial
  port = new Serial(this, Serial.list()[4], 9600);
  println(Serial.list());
}

void draw() {  
  background(0);
  smooth();
  noCursor();
  //attention easing
  float attent = attention - ang;
  if (abs(attent) > 1.2) {
    ang += attent*easing;
  }    

  pushMatrix();
  translate(width/11, height/8);
  scale(.83);
  UIprogress.timer();
  UIprogress.layout();
  Wirefr.sketch();
  popMatrix();


  if (progArm == 100) {
    slash = 70;
    delay(500);
    slash = 101;    
  } else {
   slash = progArm; 
  }


  port.write(int(progArm));
  println(int(progArm));  
}




