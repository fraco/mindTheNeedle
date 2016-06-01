//graphical user interface
float ang;
float easing = .05;

int timerStart = 0;
int secsT;
int offset;
int mill;
int minutes;
int seconds;
int hundredths;

class Revolutions { 


  //forked stopWatch by AdamTheNoob, http://processing.org/discourse/beta/num_1245105034.html
  void timer() {
    if (!paused) {
      mill=(millis()-timerStart);
      if (continued) mill += offset;      
      seconds = mill / 1000;
      minutes = seconds / 60;
      seconds = seconds % 60;
      hundredths = mill / 10 % 100;
    }    
    noStroke();
    textAlign(CENTER);
    textSize(56);
    fill(#FF7400);
    text("Mind the Needle", width/2, -25);
    textSize(38);
    textLeading(120); 
    text("By Fraco | fracoix.com", width/2, 10);

    ellipse(620, 77, 60, 60);
//    ellipse(741.5, 77, 60, 60);  
    fill(47);
    textSize(42);
    text("B  to BEGIN", width/2, height/10);

    float arcTimer = radians(map(mill, (theTime*1000), 0, -90, 272));
    if (seconds>=theTime || armN>=-10) {
      paused = true;
      timerStart = millis();
      begin = false;
    }
    ///-The Timer
    float timerColR = map(seconds, 0, theTime, 100, 255);
    fill(timerColR, 25, 75);  
    secsT = int(map(seconds, 0, theTime, theTime, 0));
    textSize(111);
    text(nf(secsT, 2, 0), width/2, height/3.5);
    arc(width/4.5, height/1.75, height/1.275, height/1.275, radians(-90), arcTimer);
    
    float radOut = height/2.56;
    float radIn = height/3;
    float px = width/4.5;
    float py = height/1.75;
    int incAng=360/theTime;
//    println(mill);
    
    stroke(122);
    strokeWeight(2);
    for(int a=-90; a<270; a+=incAng){
     line(radIn * cos(radians(a)) + px, radIn * sin(radians(a)) + py,
          radOut* cos(radians(a)) + px, radOut* sin(radians(a)) + py);
    }

  }

  void layout() {
    ///—Attention
    noStroke();
    fill(56, 75);
    //    arc(width/2, height/1.4, width/1.45, width/1.45, radians(-180), radians(0));
    arc(width/1.25, height/2.1, height/1.8, height/1.8, radians(-180), radians(0));
    fill(232, 200);
    arc(width/1.25, height/2.1, height/4, height/4, radians(-180), radians(0));
    //Speed reference lines
    stroke(83, 150);
    strokeWeight(2);
    float radInner = height/4.3;
    float radOuter = height/3.7;
    float x = width/1.25;
    float y = height/2.105;
    for (int ang = -180; ang <= 0; ang+= 30) {
      line(radInner * cos(radians(ang)) + x, radInner* sin(radians(ang)) + y, 
      radOuter * cos(radians(ang)) + x, radOuter* sin(radians(ang)) + y);
    }

    ///—Digital Representation of Actuator
    noFill();
    stroke(56);
    strokeWeight(1);
    arc(width/1.25, height/1.12, height/1.8, height/1.8, radians(-180), radians(0));
  }
}

