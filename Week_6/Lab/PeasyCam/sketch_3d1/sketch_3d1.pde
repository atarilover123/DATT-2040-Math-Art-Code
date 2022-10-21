import peasy.*;
PeasyCam cam;
void setup() {
  size(600, 600, P3D);
    cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  box(200);
}
