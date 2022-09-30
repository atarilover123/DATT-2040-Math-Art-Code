//Initiate an array of objects
Collider[] collide; 

//create some global constants

//the number of particles we will create
int particles = 10;

//some values that will drive the physics in our virtual space
float bounce = 0.005;
float gravity = 0.04;
float friction = -0.7;

void setup(){
  collide = new Collider[particles];
  
}

//our object class - lets add some collisions
class Collider{
  
  
  
}
