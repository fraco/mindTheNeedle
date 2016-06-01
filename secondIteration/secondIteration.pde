
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
PImage fondo;
PImage win;

boolean slash = false;

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
  
  fondo = loadImage("bkgrnd.png");
  win = loadImage("win.png");
  //GUI class
  UIprogress = new Revolutions();
  Wirefr = new Wireframe(); 

  //serial
  port = new Serial(this, Serial.list()[4], 9600);
  println(Serial.list());
}

void draw() {  
  background(242);
  image(fondo,0,0,width,height);
  smooth();
//  cursor(CROSS);
  noCursor();
  //attention easing
    

  pushMatrix();
  translate(width/11, height/8);
  scale(.83);
  UIprogress.timer();
  UIprogress.layout();
  Wirefr.sketch();
  float mx = mouseX;
  float my = mouseY;
  if (mousePressed) {
    println("X= "+mx+"Y= "+my);
  }
  popMatrix();
  
  

if (progArm == 100 ) {
  delay(30);
  progArm+=1;    
  paused = true;
  image(win,0,0,width,height);      
  } 

  else {
    progArm = map(armN, -180, -10, 0, 100);
//    slash = false;
  }


  port.write(int(progArm));
  println(progArm);
}

void win() {
  
}



