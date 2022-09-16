//create PVector to store position
PVector pos;

//add a PVector to store acceleration 
PVector acc;

void setup() {

  size(500, 500);

  //populate pos with x,y and z values (in this instance we use z to hold our size value)
  pos = new PVector(random(width), random(height), random(40, 70));
 
 //populate acc with x,y values 
 
 //set direction here
  acc = new PVector(0,0,0);
 
 //rtry random values
 // acc = new PVector(random(-1,1),random(-1,1),0);
 
 //styling
 noFill();
 strokeWeight(5);
 stroke(255);
}

void draw() {

  background(0);
  
  //use the add method to add toghter
  pos.add(acc);

  ellipse(pos.x, pos.y, pos.z, pos.z);
  point(pos.x, pos.y);
}

//generate a new random position on mousePress
void mousePressed(){
  pos = new PVector(random(width), random(height), random(40, 70));}
