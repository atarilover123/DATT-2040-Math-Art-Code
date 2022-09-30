//polar to cartesian
//https://mathinsight.org/polar_coordinates

//really similar to how we created a circle

float r = 120; //length of our line
float theta = 0; //rotation - in radians

void setup(){
  size(500,500);
  
}

void draw(){
  background(255);
   
  float x = r * cos(theta);
  float y = r * sin(theta);
  pushMatrix();
  translate(width/2,height/2);
  line(0,0,x,y);
  ellipse(x,y,30,30);
  
  popMatrix();
  
  //theta+=0.01;
}
