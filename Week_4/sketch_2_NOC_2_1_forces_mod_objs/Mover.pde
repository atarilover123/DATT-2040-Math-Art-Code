class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float damp = random(0.4, 0.9);
  float winddiv = map(damp, 0.4, 0.95,2,3);
  float radius = map(damp, 0.4, 0.95, 80, 10);

  Mover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, radius, radius);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -damp;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -damp;
      location.y = height;
    }
  }

}
