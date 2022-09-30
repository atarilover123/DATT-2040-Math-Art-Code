// Pendulum - modded Sept 27

// Daniel Shiffman <http://www.shiffman.net>

// A simple pendulum simulation
// Given a pendulum with an angle theta (0 being the pendulum at rest) and a radius r
// we can use sine to calculate the angular component of the gravitational force.

// Gravity Force = Mass * Gravitational Constant;
// Pendulum Force = Gravity Force * sine(theta)
// Angular Acceleration = Pendulum Force / Mass = gravitational acceleration * sine(theta);

// Note this is an ideal world scenario with no tension in the
// pendulum arm, a more realistic formula might be:
// Angular Acceleration = (g / R) * sine(theta)

// For a more substantial explanation, visit:
// http://www.myphysicslab.com/pendulum1.html

//added object array, spread and damp
Pendulum[] p;
int num = 1;
int spread = 5;
float dampval = 1; 
//float dampval = 0.995; 

void setup() {
  size(800, 400);
  smooth();
  p = new Pendulum[num];
  // Make a new Pendulum(s) with an origin location and armlength
  for (int i = 0; i < num; i++) {
    p[i] = new Pendulum(new PVector((num/2*spread)+width/2-(i*spread), 0), 300-(i*10), (PI/2)-(i*0.1));
  }
}

void draw() {

  background(255);
  for (int i = 0; i < num; i++) {
    p[i].go();
  }
}

void mousePressed() {
  for (int i = 0; i < num; i++) {
    p[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < num; i++) {
    p[i].stopDragging();
  }
}
