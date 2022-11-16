PVector points[] = new PVector[1000];

void setup() {
  size(600, 600, P3D);
  stroke(0);
  pixelDensity(2);

  for (int i=0; i<points.length; i++) {
    points[i] = PVector.random3D().mult(250);
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateY(frameCount*0.007);
  rotateX(frameCount*0.006);

  for (int i = 0; i < points.length; i++) {
    strokeWeight(points[i].z*0.035);
    point( points[i].x, points[i].y, points[i].z);

    strokeWeight(1);
    for (int j = 0; j < points.length; j++) {

      if (dist3d(points[i].x, points[i].y, points[i].z, points[j].x, points[j].y, points[j].z) < 35) {
        line(points[i].x, points[i].y, points[i].z, points[j].x, points[j].y, points[j].z);
      }
    }
  }
}

float dist3d(float x1, float y1, float z1, float x2, float y2, float z2) {

  float xp_sub = x1-x2;
  float yp_sub = y1-y2;
  float zp_sub = z1-z2;

  float d = sqrt(sq(xp_sub) + sq(yp_sub) + + sq(zp_sub));

  return d;
}

void mousePressed(){
  
  for (int i=0; i<points.length; i++) {
    points[i] = PVector.random3D().mult(250);
  }
}
