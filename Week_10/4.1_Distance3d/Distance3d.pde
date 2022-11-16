//https://www.calculatorsoup.com/calculators/geometry-solids/distance-two-points.php

float x = 5;
float y = 6;
float z =  2;

float x1 = -7;
float y1 = 11;
float z1 = -13;

void setup() {

  println("inbuilt function ", dist(x, y, z, x1, y1,z1));
  println("custom function ", mydist(x, y, z, x1, y1, z1));

}

void draw() {
 
}

float mydist(float x1, float y1, float z1, float x2, float y2, float z2) {

  float xp_sub = x1-x2;
  float yp_sub = y1-y2;
  float zp_sub = z1-z2;

  float d = sqrt(sq(xp_sub) + sq(yp_sub) + sq(zp_sub));

  return d;
}
