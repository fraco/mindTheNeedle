boolean paused = true;
boolean continued = false;
boolean begin = false;
boolean restart = false;

void keyPressed() { // pause
  if (key=='p') {
    paused = true;
    begin = false;
    restart = false;
  }
  if (key=='r') { // restart
    paused = false;
    timerStart = millis();
    restart = true;
    begin = false;
  }

  else if (key=='b') { // continue
    paused = false;
    timerStart = millis();
    begin = true;
    offset = mill;
  }
}

