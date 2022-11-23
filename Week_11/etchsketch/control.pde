Knob[] kn;

int num = 2;

class Knob {

  int x;
  int y; 
  int size;

  float val = PI;
  float a = 0;

  float output;

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
        output = map(a, -PI, PI, width-offset, 0);
      }
    }

    pushMatrix();
    translate(x, y);
    rotate(PI);
    translate(-x, -y);
    translate(x, y);
    rotate(-HALF_PI);

    rotate(-val);
    fill(255);
    ellipse(0, 0, size, size);
    noFill();

    noStroke();

    fill(180);
    rect(0, -(size/12), size/2, size/6);
    popMatrix();
  }
}

