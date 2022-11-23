int offset = 100;
float lup ;
float lr;
void setup() {

  size(600, 600);

  kn = new Knob[num];
  kn[0] = new Knob(30, 30, 60);
  kn[1] = new Knob(30, 100, 60);

  lup = offset+kn[0].output;
  lr = offset+kn[1].output ;

  background(0);
}

void draw() {
  //background(0);
  fill(0);
  noStroke();
  rect(0, 0, 65, 135);
  for (int i = 0; i < num; i++) {
    kn[i].knobdraw();
    // println(kn[2].output);
    float updown = offset+kn[0].output ;
    float leftright = offset+kn[1].output ;

    updown =constrain(updown, offset, width-offset);
    leftright =constrain(leftright, offset, height-offset);

    fill(255);
    stroke(255);
    line(updown, leftright, lup, lr);
    lup = updown;
    lr = leftright;
  }
}

