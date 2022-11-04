import processing.sound.*;

mysin[] sin;
int num = 24;
int step;

void setup() {
  size(450, 700);

  sin = new mysin[num];

  step = height/num;
  for (int i = 0; i < num; i++) {
    sin[i] = new mysin(width/2+1, (step/2)+i*step, 0.1+i*0.01, i);
  }
}

void draw() {

  background(0);

  //noStroke();
  for (int i = 0; i < num; i++) {
    sin[i].drawsin();
  }
  stroke(255);
  line(width/2, 0, width/2, height);
}

class mysin {

  float x;
  float y;

  float sp;

  boolean trig = false;
  color c;
  int index;

  int offset = 2;

  //sound stuff
  SinOsc sine;
  Env env;

  // Times and levels for the ASR envelope
  float attackTime = 0.0001;
  float sustainTime = 0.9;
  float sustainLevel = 0.3;
  float releaseTime = 0.2;

  // duration before triggering new note
  int duration = 100;

  // This variable stores the point in time when the next note should be triggered
  int trigger = millis();


  mysin(float x, float y, float sp, int index) {
    this.x = x;
    this.y = y;
    this.sp = sp;

    this.index = index;

    // Create triangle wave and start it
    sine = new SinOsc(sinmusic_nosound.this);

    // Create the envelope
    env = new Env(sinmusic_nosound.this);

    c = 255;
  }

  void drawsin() {
    fill(c);
    noStroke();
    float sinval = sin(frameCount*(sp*0.05))*width/2;
    ellipse(x+sinval, y, step, step);

    if (x+sinval >= (width/2)-offset & x+sinval <= (width/2)+offset ) {
      
      sine.play(int(random(1000)), 0.1);
      
      c = color(random(255), random(255), random(255));
      noFill();
      stroke(255);
      ellipse(width/2, y, step*3, step*3);
      trig = true;
    } else {
      trig = false;
    }
  }
}
