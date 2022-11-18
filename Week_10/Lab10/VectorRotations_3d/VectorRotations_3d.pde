//code from
//https://behreajj.medium.com/3d-rotations-in-processing-vectors-matrices-quaternions-10e2fed5f0a3

float scalar = 100.0;
float rotincr = 0.01;
float camdst, invwidth;
Vec3 v0, v1, v2;

void setup() {
  size(512, 256, P3D);
  camdst = height * 0.86602;
  invwidth = 1.0 / float(width);

  float halfscalar = scalar * 0.5;
  v0 = new Vec3(halfscalar, halfscalar, halfscalar);
  v1 = new Vec3(v0);
  v2 = new Vec3(v0);
}

void draw() {
  float camt = -TWO_PI + mouseX * invwidth * PI;
  camera(cos(camt) * camdst, 0, sin(camt) * camdst,
    0.0, 0.0, 0.0,
    0.0, 1.0, 0.0);
  background(0xffffffff);

  // Background sphere.
  noFill();
  strokeWeight(1.0);
  stroke(0x3f000000);
  sphere(scalar);

  // rotate around i
  v0.rotateX(rotincr);
  stroke(0xffff0000);
  strokeWeight(1.5);
  line(0.0, 0.0, 0.0, v0.x, v0.y, v0.z);  
  strokeWeight(10.0);
  point(v0.x, v0.y, v0.z);

  // rotate around j
  v1.rotateY(rotincr);
  stroke(0xff00ff00);
  strokeWeight(1.5);
  line(0.0, 0.0, 0.0, v1.x, v1.y, v1.z);  
  strokeWeight(10.0);
  point(v1.x, v1.y, v1.z);

  // rotate around k
  v2.rotateZ(rotincr);
  stroke(0xff0000ff);
  strokeWeight(1.5);
  line(0.0, 0.0, 0.0, v2.x, v2.y, v2.z);  
  strokeWeight(10.0);
  point(v2.x, v2.y, v2.z);

  // As a control, test the above
  // against conventional method.
  float frmrot = rotincr * frameCount;
  strokeWeight(15.0);

  pushMatrix();
  rotateY(frmrot);
  stroke(0x7f00ff7f);
  point(50.0, 50.0, 50.0);
  popMatrix();

  pushMatrix();
  rotateX(frmrot);
  stroke(0x7fff7f00);
  point(50.0, 50.0, 50.0);
  popMatrix();

  pushMatrix();
  rotateZ(frmrot);
  stroke(0x7f7f00ff);
  point(50.0, 50.0, 50.0);
  popMatrix();
}
