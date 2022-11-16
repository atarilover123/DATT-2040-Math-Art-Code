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
    strokeWeight(1.5+abs(sin(i*(points[i].z))*6));
    point( points[i].x, points[i].y, points[i].z);

    strokeWeight(1);
    for (int j = 0; j < points.length; j++) {

    }
  }
}
