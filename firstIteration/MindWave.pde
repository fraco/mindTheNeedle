//mindwave functions
int attention  = 5;
int meditation = 10;

void poorSignalEvent(int sig) {
  //  println("SignalEvent "+sig);
}
public void attentionEvent(int attentionLevel) {
//  println("Attention Level: " + attentionLevel);
  attention = attentionLevel;
}
void meditationEvent(int meditationLevel) {
  //  println("Meditation Level: " + meditationLevel);
  meditation = meditationLevel;
}
void blinkEvent(int blinkStrength) {

  //  println("blinkStrength: " + blinkStrength);
}
public void eegEvent(int delta, int theta, int low_alpha, int high_alpha, 
int low_beta, int high_beta, int low_gamma, int mid_gamma) {
}
void rawEvent(int[] raw) {
  //println("rawEvent Level: " + raw);
}
void stop() {
  neuroSocket.stop();
  super.stop();
}

