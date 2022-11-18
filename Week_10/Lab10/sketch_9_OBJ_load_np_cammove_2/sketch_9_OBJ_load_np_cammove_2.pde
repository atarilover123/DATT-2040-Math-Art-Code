import peasy.org.apache.commons.math.geometry.*;
import peasy.*;
PeasyCam cam;

PShape sw;

int numscenes = 5;
float[] distances = {12.75, 5.38, 2.017, 12.75, 3.94};
float[] mrots = { 10.3, 7.5, -1.7, 0.17, 2.25, 4.8, -0.6, 076, 1.72, -0.8, 4.56, 11.8, 0.25, 3.93, 0.255};

float d = 0;
float r = 0;
float p = 0;

float vl = 0.5;

void setup() {
  size(512, 512, P3D);
  cam = new PeasyCam(this, 400);
  sw = loadShape("Subway.obj");
  //perspective, removes clipping
  perspective(PI/3, float(width)/float(height), 1, 100000);
}
float mrot=0;

void draw() {
  background(0);

  shape(sw);
  println(cam.getPosition());
  println(cam.getDistance());

  Rotation rot = new Rotation(RotationOrder.XYZ, radians(180), mrot, 0);

  if (keyPressed & key == 'r') {
    mrot+= 0.1;
  }

  //Vector3D center = new Vector3D( -0.5,1.00000004,sin(frameCount*0.01)*3.5); // look at the origin (0,0,0)
  Vector3D center = new Vector3D( r, d, p);

  double distance = 2; // from this far away
  CameraState state = new CameraState(rot, center, distance);
  cam.setState(state, 0);
}

void keyPressed() {

  if (keyCode == RIGHT) {
    r-=vl;
  }

  if (keyCode == LEFT) {
    r+=vl;
  }

  if (keyCode == UP) {
    d-=vl;
  }

  if (keyCode == DOWN) {
    d+=vl;
  }

  if (key == 'w') {
    p+=vl;
  }

  if (key == 's') {
    p-=vl;
  }
}
