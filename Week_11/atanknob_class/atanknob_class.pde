Knob[] kn;

int col = 5;
int row = col;

int num = col*row;

void setup() {

  size(600, 600);
  int stepsize = width/col;

  kn = new Knob[num];
  for (int i = 0; i < num; i++) {
    int ks = stepsize;
    int offset = stepsize/2;
    int x = i%num%col;
    int y = i%num/col; 

    kn[i] = new Knob(offset+x*stepsize, offset+y*stepsize, ks);
  }
}

void draw() {
  background(0);


  for (int i = 0; i < num; i++) {
    kn[i].knobdraw();
    //print output - access individual knob or all
    println(kn[2].output);
  }
}

class Knob {

  int x;
  int y; 
  int size;

  float val = PI;
  float a = 0;

  float output;

  int g = int(random(255));
  int b = int(random(255));

  Knob(int xpos, int ypos, int ks) {
    x = xpos;
    y = ypos;
    size = ks;
  }

  void knobdraw() {
    noStroke();
    if (mousePressed) {
      if (dist(mouseX, mouseY, x, y) <= size/2) {

        a = atan2(mouseX-x, mouseY-y);
        val = a;
        output = map(a, -PI, PI, 1, 0);
      }
    }

    pushMatrix();
    translate(x, y);
    rotate(PI);
    translate(-x, -y);
    translate(x, y);
    rotate(-HALF_PI);

    rotate(-val);
    fill(output*255, g, b);
    ellipse(0, 0, size, size);
    noFill();
    
    stroke(0);
    strokeWeight(10);
    ellipse(0, 0, size-8, size-8);
    
    noStroke();

    //fill(160);
    fill(g, b,output*255);
    rect(0, -(size/12), size/2, size/6);
    popMatrix();
  }
}
