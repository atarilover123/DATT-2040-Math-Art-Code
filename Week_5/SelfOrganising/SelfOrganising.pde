//Initiate an arraylist of objects
ArrayList<Collider> collide;

//create some global constants

//the number of particles we will create
int particles = 0;

//some values that will drive the physics in our virtual space
float bounce = 0.005;
float gravity = 0.06;
float friction = -0.1;

void setup() {
  size(600, 400);

  //create and set lengthy of object array
  collide = new ArrayList<Collider>();

  //populate
  for (int i = 0; i < particles; i++) {
    collide.add(new Collider(new PVector(random(width), random(height)), random(5, 50), i));
  }

  noStroke();
  fill(255);
}

int inc = 0;
void draw() {
  background(0);
  int spawn = 3;
  if (frameCount%spawn >=spawn-1 & inc < 350) {
    inc++;
    collide.add(new Collider(new PVector(width/2+random(-5, 5), 100+random(-5, 5)), random(5, 50), inc));
  }
  for (int i = collide.size()-1; i >= 0; i--) {
    Collider c = collide.get(i);
    c.collide();
    c.selected(i);
    c.move();
    c.display();
  }
  println(inc, " particles at ", frameRate);
}

class Collider {

  //variables that are global to the Collider object

  //location
  PVector loc;

  //create a PVector to use in force calc
  PVector force = new PVector(0, 0);

  float diameter;

  //easy way to store the index of each object - this will come in handy later
  int id;

  //a multiplication value to scale the force amount
  //- think how much the particles bounce off each others
  //added to the Collider object - now each Collider object has it's own famt
  float famt = 2.5;
  //we will also set a random reduction amount
  float freduce = 0.01;

  //Constructor for our object - we can use the variables in the () brackets to feed values to our object.
  //take a look at the setup() where we do this
  Collider(PVector locin, float di, int idi) {

    loc = locin;
    diameter = di;

    id = idi;

    //    others = oi;
  }

  //collide - this calculates collisiosn
  void collide() {
    //check all particles above our id value
    //this was the mechanic we looked at in class
    //for (int i = id + 1; i < particles; i++) {

    //instead of the above mechanic
    //you could also package your collision detection in somthign like this:
    /*
    for(int i = 0 ; i < particles; i++){
     if(i != id){
     
     }
     }
     */

    //new method implemented below
    for (int i = collide.size()-1; i >= 0; i--) {
      if (i != id) {



        //PVectors to hold distance of current particle
        //and the particles we cycle through - what we will check against
        PVector dxy1 = new PVector (loc.x, loc.y);
        PVector dxy2 = new PVector (collide.get(i).loc.x, collide.get(i).loc.y);

        //subtract - we will use this later to calculate angle
        PVector sub = PVector.sub(dxy2, dxy1);

        //calculate distance and approximate the minimum distance (when particle edges overlap)
        float distance = PVector.dist(dxy1, dxy2);
        float minDist = (collide.get(i).diameter + diameter)/2;

        //if distance is smaller than our minDist variable
        if (distance < minDist) {

          stroke(255);
          line(loc.x, loc.y, collide.get(i).loc.x, collide.get(i).loc.y);

          //using non Pvector
          //float angle = atan2(dy, dx);

          //calculate angle of bounce using atan and the sub PVector from earlier
          float angle = atan2(sub.y, sub.x);

          //variables for new heading
          float targetX = loc.x + cos(angle) * minDist;
          float targetY = loc.y + sin(angle) * minDist;

          //speed of trajectory (acceleration)
          float ax = (targetX - collide.get(i).loc.x) * bounce;
          float ay = (targetY - collide.get(i).loc.y) * bounce;

          force.x -= ax * famt;
          force.y -= ay * famt;
          collide.get(i).force.x += ax * famt;
          collide.get(i).force.y += ay * famt;

          //additional code to reduce the famt multiplier each collision
          //famt stands for force amt - each collision reudces until particles stop
          //rn this is a global variable but you could try moving it into the Collider object
          //that way each particle could have it's own unique starting famt

          //replaced value with freduce
          /*
          famt -= freduce;
           
           famt = constrain(famt, 0, 30);
           if (famt == 0) {
           force.x = 0;
           }
           */
        }
      }
    }
  }

  //move - this calculates movement, boundary collisions + adds friction to mimic more real physics - result = balls slow down, come to halt
  void move() {

    //addition assignments - gravity effects y (downwards pull), loc.x, loc.x have an addition assignment corresponding to force.x, force.y
    force.y += gravity;
    loc.x += force.x;
    loc.y += force.y;

    //check boundaries and create bounce
    //friction at a value of -1 will mean particles bounce forever with no dimishing magnitude
    //a vlue of say -0.9 will mean that each bounce we lose a bit of height on our particles

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
      force.y *= friction ;
    }
  }
  //function to move ball if selected
  void selected(int i) {

    if (mousePressed) {

      if (dist(mouseX, mouseY, loc.x, loc.y) <= diameter/2) {

        collide.remove(i);
      }
    }
  }

  //draw an ellipse at the corresponding positions and size - in this case our loc.x, loc.y
  void display() {
    noFill();
    ellipse(loc.x, loc.y, diameter, diameter);
  }
}
