float valAtt;
float armN = -180;
float progArm;
float valArd;
int theTime = 5;
float mang;

class Wireframe {

  ////////////////———SKETCH———////////////////
  ///—WIREFRAME
  float testCircVect = -180;

  void sketch() {
    ///—Attention Level
    ///–MOUSE
    float mmov = map(mouseX, 0, width/2, 0, 100);
    float mattent = mmov - mang;
    if (abs(mattent) > 1.2) {
      mang += mattent*easing;
    }
    ///–MINDWAVE
    float attent = attention - ang;
    if (abs(attent) > 1.2) {
      ang += attent*easing;
    }
    
    //|||—VBLES—|||—\\\
    float mY2At = mang; 
//    float mY2At = ang;

    float angAtt2N = map(mY2At, 0, 100, -180, 0);//interactive variable

    ///—Attention Color
    float attColor = map(mY2At, 0, 100, 0, 255);
    float attAlfa = map(mY2At, 0, 100, 150, 255);

    stroke(#FF7400, attAlfa);
    strokeWeight(9);    
    float attRadius = width/6;
    float r = attRadius;
    line(width/1.25, height/2.1, (width/1.25)+cos(radians(angAtt2N))*r, (height/2.1)+sin(radians(angAtt2N))*r);
    textSize(32);
    textAlign(LEFT);
    fill(#FF7400);
    text("Attention: "+int(mY2At), width/1.6, height/1.9);


    ///—MENTAL MODEL of physical actuator
    ///—The ARM
    noStroke();
    fill(83, 150);
    arc(width/1.25, height/1.12, height/1.85, height/1.85, radians(-180), radians(armN));

    ///—The NEEDLE
    strokeWeight(1);
    float movTri = armN+90;
    pushMatrix();
    noStroke();
    fill(attColor, 0, 0, attAlfa);
    translate(width/1.25, height/1.12);    
    rotate(radians(movTri));
    triangle( 2, -(height/3.75), 
    (0+height/24), -(height/4.12), 
    2, -(height/4.5));
    popMatrix();     

    progArm = map(armN, -180, -10, 0, 100);
    text("The Needle: "+int(progArm)+"%", width/1.6, height/1.055);

    ///—Arm's behavior
    int level = 3;
    int difficult = 15; //5-20
    float minTime = theTime;
    int endAngle = -10;

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
}

