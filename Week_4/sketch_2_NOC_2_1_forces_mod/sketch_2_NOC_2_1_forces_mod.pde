Mover m;

void setup() {
  size(600, 400);
  smooth();
  m = new Mover();
}

float damp = 1;

void draw() {
  background(255);

  PVector wind = new PVector(0.0, 0);
  PVector gravity = new PVector(0, 0.1);

  m.applyForce(wind);
  m.applyForce(gravity);


  m.update();
  m.display();
  m.checkEdges();
}
