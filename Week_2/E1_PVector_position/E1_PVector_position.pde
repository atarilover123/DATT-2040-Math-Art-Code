//create PVector to store position
PVector pos;

void setup() {

  size(500, 500);

  //populate with x,y and z values (in this instance we use z to hold our size value)
  pos = new PVector(random(width), random(height), random(40, 70));
 
 //styling
 noFill();
 strokeWeight(5);
 stroke(255);
}

void draw() {

  background(0);

  ellipse(pos.x, pos.y, pos.z, pos.z);
  point(pos.x, pos.y);
}

//generate a new random position on mousePress
void mousePressed(){
  pos = new PVector(random(width), random(height), random(40, 70));}
