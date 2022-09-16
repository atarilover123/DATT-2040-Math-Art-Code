//create PVector to store position
PVector pos;

//add a PVector to store acceleration
PVector acc;

int speed = 4;

void setup() {

  size(500, 500);

  //populate pos with x,y and z values (in this instance we use z to hold our size value)
  pos = new PVector(random(width), random(height), random(40, 70));

  //populate acc with x,y values
  acc = new PVector(random(-speed, speed), random(-speed, speed), 0);

  //styling
  noFill();
  strokeWeight(5);
  stroke(255);
}

void draw() {

  background(0);

  //use the add method to add toghter
  pos.add(acc);


  //check to see if pos.x is contained within the screen width
  if ( (pos.x > width) || (pos.x < 0)) {

    //create a border
    //if ( (pos.x > width-(pos.z/2)) || (pos.x < (pos.z/2))) {

    //multiply the accelearation.x by -1
    // we can think of this as a switch between positive and negative values for acceleration
    acc.x = acc.x * -1;
  }

  //check to see if pos.y is contained within the screen width
  if ( (pos.y > width) || (pos.y < 0)) {

    //create a border
    //if ( (pos.y > height-(pos.z/2)) || (pos.y < (pos.z/2))) {

    //multiply the acceleration.y by -1
    acc.y = acc.y * -1;
  }


  ellipse(pos.x, pos.y, pos.z, pos.z);
  point(pos.x, pos.y);
}

//generate a new random position on mousePress
void mousePressed() {
  speed = int(random(8));
  pos = new PVector(random(width), random(height), random(40, 70));
}
