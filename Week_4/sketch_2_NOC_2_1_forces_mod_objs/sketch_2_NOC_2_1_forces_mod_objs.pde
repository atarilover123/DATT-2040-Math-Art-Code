Mover[] m;
int num = 8;

void setup() {
  size(600, 400);
  smooth();
  m = new Mover[num];

  for (int i = 0; i<num; i++) {
    m[i] = new Mover(random(width), random(3));
  }
}

void draw() {
  background(255);

  PVector wind = new PVector(0.04, 0);
  PVector gravity = new PVector(0, 0.1);

  for (int i = 0; i<num; i++) {
    m[i].applyForce(gravity);
    m[i].applyForce(wind.div(m[i].winddiv));


    m[i].update();
    m[i].display();
    m[i].checkEdges();
  }
}
