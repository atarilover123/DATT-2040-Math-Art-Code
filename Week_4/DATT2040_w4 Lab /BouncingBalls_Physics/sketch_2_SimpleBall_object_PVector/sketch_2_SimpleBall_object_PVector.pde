//Initiate an array of objects
Collider[] collide;

//create some global constants

//the number of particles we will create
int particles = 10;

//some values that will drive the physics in our virtual space
float bounce = 0.005;
float gravity = 0.04;
float friction = -0.7;

void setup() {
  size(600, 400);

  collide = new Collider[particles];

  for (int i = 0; i < particles; i++) {
    collide[i] = new Collider(new PVector(random(width), random(height)), random(5, 30), i);
  }
  noStroke();
  fill(255);
}


void draw() {
  background(0);
  for (Collider c : collide) {
    c.move();
    c.display();
  }
}

class Collider {

  PVector loc;

  //use in force calc
  PVector force = new PVector(0, 0);

  float diameter;

  //easy way to store the index of each object - this will come in handy later
  int id;

  Collider(PVector locin, float di, int idi) {

    loc = locin;
    diameter = di;

    id = idi;
  }

  void move() {

    force.y += gravity;
    loc.x += force.x;
    loc.y += force.y;

    if (loc.x + diameter/2 > width) {
      loc.x = width - diameter/2;
      force.x *= friction;
    } else if (loc.x - diameter/2 < 0) {
      loc.x = diameter/2;
      force.x *= friction;
    }
    if (loc.y + diameter/2 > height) {
      loc.y = height - diameter/2;
      force.y *= friction;
    } else if (loc.y - diameter/2 < 0) {
      loc.y = diameter/2;
      force.y *= friction;
    }
  }

  void display() {
    ellipse(loc.x, loc.y, diameter, diameter);
  }
}
