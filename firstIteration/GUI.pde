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
    textSize(32);
    fill(222,255,0);
    text("Mind the Needle      By Fraco Interactive | fracoix.com", width/2, -10);    
    fill(255);
    textSize(22);
    text("PRESS\nB to BEGIN — P to PAUSE — R to RESTART", width/2, height/14);

    float arcTimer = radians(map(seconds, theTime, 0, -90, 270));
    if (seconds>=theTime || armN>=-10) {
      paused = true;
      timerStart = millis();
      begin = false;
    }
    ///-The Timer
    fill(#00CEFF, 150); 
    secsT = int(map(seconds, 0, theTime, theTime, 0));
    textSize(24);
    text(nf(secsT, 2, 0), width/3, height/1.07);
    arc(width/4.5, height/1.15, height/5, height/5, radians(-90), arcTimer);
  }

  void layout() {
    ///—Attention
    noStroke();
    fill(122, 75);
    arc(width/2, height/1.4, width/1.45, width/1.45, radians(-180), radians(0));
    fill(0, 200);
    ellipse(width/2, height/1.4, height/2, height/2);
    //Speed reference lines
    stroke(255, 150);
    strokeWeight(2);
    float radInner = width/3.56;
    float radOuter = width/2.93;
    float x = width/2;
    float y = height/1.4;
    for (int ang = -180; ang <= 0; ang+= 30) {
      line(radInner * cos(radians(ang)) + x, radInner* sin(radians(ang)) + y, 
      radOuter * cos(radians(ang)) + x, radOuter* sin(radians(ang)) + y);
    }

    ///—Digital Representation of Actuator
    noFill();
    stroke(56);
    strokeWeight(1);
    arc(width/1.31, height/1.07, height/4, height/4, radians(-180), radians(0));
  }
}

