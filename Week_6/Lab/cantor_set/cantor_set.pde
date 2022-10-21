void setup() {
  size(500, 500);
  background(255);
  fill(0);
  noStroke();
}

void draw() {
  background(255);
  cantor(50, 50, 400);
}


void cantor(float x, float y, float len) {
  if (len > 1) {

    rect(x, y, len, 10);
    y +=75;
    cantor(x, y, len/3);
    cantor(x+len*2/3, y, len/3);
  }
}
