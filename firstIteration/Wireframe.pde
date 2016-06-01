float valAtt;
float armN = -180;
float progArm;
float valArd;
int theTime = 12;

class Wireframe {

  ////////////////———SKETCH———////////////////
  ///—WIREFRAME
  float testCircVect = -180;

  void sketch() {
    ///—Attention Level
    float mY2At = map(mouseX, 0, width/2, 0, 100);
//    float mY2At = ang;

    float angAtt2N = map(mY2At, 0, 100, -180, 0);//interactive variable

    ///—Attention Color
    float attColor = map(mY2At, 0, 100, 100, 255);
    float attAlfa = map(mY2At, 0, 100, 150, 255);

    stroke(#C3FF00, attAlfa);
    strokeWeight(9);    
    float attRadius = width/3;
    float r = attRadius;
    line(width/2, height/1.4, (width/2)+cos(radians(angAtt2N))*r, (height/1.4)+sin(radians(angAtt2N))*r);

    fill(#C3FF00, attAlfa);
    text("Attention: "+int(mY2At), width/2, height/1.25);

    
    ///—MENTAL MODEL of physical actuator
    ///—The ARM
    noStroke();
    fill(255,150);
    arc(width/1.31, height/1.07, height/4, height/4, radians(-180), radians(armN));

    ///—The NEEDLE
    strokeWeight(1);
    float movTri = armN+90;
    pushMatrix();
    noStroke();
    fill(255,255-attColor,255-attColor,attAlfa);
    translate(width/1.31, height/1.07);    
    rotate(radians(movTri));
    triangle( 2,             -(height/8.25), 
             (0+height/42),  -(height/9), 
              2,             -(height/9.5));
    popMatrix(); 

    fill(255,150);
    
       
    progArm = map(armN, -180, -10, 0, 100);
    text("The Needle: "+int(progArm)+"%", width/1.75, height/1.07);

    ///—Arm's behavior
    int level = 3;
    int difficult = 12; //5-20
    float minTime = theTime;
    int endAngle = -10;
    
    ///—///—SLASH
//    valArd = map(progArm,0,100, 0,180);
//    if (valArd >=180){
//      slash = 
//    }
    
    ///—Arm's speed
    if (begin == true || continued == true) {  
      armN -= (-1*(mY2At/(difficult*level)));
      paused = false;
      restart = false;
    } 
    if (paused == true) {
      armN = armN;
      begin = false;
      continued = false;
    } 
    if (restart == true) {
      armN = -180;      
      paused = true;
    }
    if (armN > endAngle) {
      armN = endAngle;
    }
  }
  
  ///—SKETCH 2
  
  void sketchTwo() {
    ///—Attention Level
    float mY2At = map(mouseX, 0, width/2, 0, 100);
//    float mY2At = ang;
    float angAtt2N = map(mY2At, 0, 100, -180, 0);//interactive variable

    ///—Attention Color
    float attColor = map(mY2At, 0, 100, 100, 255);
    float attAlfa = map(mY2At, 0, 100, 150, 255);

    stroke(#C3FF00, attAlfa);
    strokeWeight(9);    
    float attRadius = height/3.2;
    float r = attRadius;
    line(width/4, height/1.35, (width/4)+cos(radians(angAtt2N))*r, (height/1.35)+sin(radians(angAtt2N))*r);

    fill(#C3FF00, attAlfa);
    text("Attention: "+int(mY2At), width/2, height/1.25);

    
    ///—MENTAL MODEL of physical actuator
    ///—The ARM
    noStroke();
    fill(255,150);
    arc(width/1.33, height/1.35, height/1.45, height/1.45, radians(-180), radians(armN));

    ///—The NEEDLE
    strokeWeight(1);
    float movTri = armN+90;
    pushMatrix();
    noStroke();
    fill(255,255-attColor,255-attColor,attAlfa);
    translate(width/1.33, height/1.35);    
    rotate(radians(movTri));
    triangle( 2,             -(height/3), 
             (0+height/16),  -(height/3.25), 
              2,             -(height/3.5));
    popMatrix(); 

    fill(255,150);
    progArm = map(armN, -180, -10, 0, 100);
    text("The Needle: "+int(progArm)+"%", width/1.75, height/1.07);

    ///—Arm's behavior
    int level = 3;
    int difficult = 12; //5-20
    float minTime = theTime;
    int endAngle = -10;

    if (begin == true || continued == true) {  
      armN -= (-1*(mY2At/(difficult*level)));
      paused = false;
      restart = false;
    } 
    if (paused == true) {
      armN = armN;
      begin = false;
      continued = false;
    } 
    if (restart == true) {
      armN = -180;      
      paused = true;
    }
    if (armN > endAngle) {
      armN = endAngle;
    }
  }
  
  
  
}

