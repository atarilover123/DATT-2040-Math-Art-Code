import themidibus.*; //Import the library
Midi[] mymidi;

MidiBus myBus; // The MidiBus

int harmonies = 1;

int num = 16*harmonies;

void setup() {
  size(800, 800);
  background(0);

  //MidiBus.list(); // List all available Midi devices

  myBus = new MidiBus(this, 0, 2); // Create a new MidiBus using the device index to select the Midi input and output devices

  mymidi = new Midi[num];

  for (int i = 0; i < num; i++) {

    mymidi[i] = new Midi(i%16);
    myscales[0][i%16] = int(random(0, 127));
  }

  arrayvals();
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < num; i++) {
    mymidi[i].harmonic();
  }
  popMatrix();
}

class Midi {

  int midichannel;

  float amp =random(100, 250);
  float period = random(25, 50);

  int note;

  float x;
  float y;

  float rx = random(-100, 100);
  float ry = random(-100, 100);

  int counter = 0;
  boolean bang;

  Midi(int mc) {
    midichannel = mc;
  }

  void harmonic() {

    x = rx+sin(frameCount*0.01)*amp*sin(frameCount/period);
    y = ry+cos(frameCount*0.02)*amp*cos(frameCount/period);
    stroke(255);

    strokeWeight(7);
    point(x, y);

    for (int i = 0; i < num; i++) {
      if (i > midichannel || i < midichannel) {
        float dist = dist(this.x, this.y, mymidi[i].x, mymidi[i].y);
        if (dist <= 30) {
          strokeWeight(1);
          line(this.x, this.y, mymidi[i].x, mymidi[i].y);
          noFill();
          ellipse((this.x+ mymidi[i].x)/2, (this.y+mymidi[i].y)/2, 50, 50);
          play(i);
        }
      }
    }
  }

  void play(int pmc) {
    int channel = pmc;
    int pitch = myscales[scalenum][pmc%16]+octave;
    int velocity = 127;

    note = pitch;

    counter++;
    if (counter == 1) {
      bang = !bang ;
    }

    if (counter == 2 ) {
      bang = !bang;
    }

    if (bang == true) {
      myBus.sendNoteOff(channel, note, velocity); // stop previous note if still going
      myBus.sendNoteOn(channel, note, velocity); // Send a Midi noteOn
    }

    if (counter == 50) {
      myBus.sendNoteOff(channel, note, velocity); // Send a Midi nodeOff
      counter = 0;
    }
  }
}
