import peasy.org.apache.commons.math.geometry.*;
import peasy.*;
PeasyCam cam;

PShape sw;

int numscenes = 5;
float[] distances = {12.75, 5.38, 2.017, 12.75, 3.94};
float[] mrots = { 10.3, 7.5, -1.7, 0.17, 2.25, 4.8, -0.6, 076, 1.72, -0.8, 4.56, 11.8, 0.25, 3.93, 0.255};

void setup() {
  size(512, 512, P3D);
  cam = new PeasyCam(this, 400);
  sw = loadShape("Subway.obj");
  //perspective, removes clipping
  perspective(PI/3, float(width)/float(height), 1, 100000);
}

void draw() {
  background(0);

  shape(sw);
  println(cam.getPosition());
  println(cam.getDistance());
}

void keyReleased() {
  if (key == ' ') {

    Rotation rot = new Rotation(RotationOrder.XYZ, mrots[int(random(mrots.length))], mrots[int(random(mrots.length))], mrots[int(random(mrots.length))]);

    Vector3D center = Vector3D.zero; // look at the origin (0,0,0)
    double distance = distances[int(random(distances.length))]; // from this far away
    CameraState state = new CameraState(rot, center, distance);
    cam.setState(state, 1000);
  }
}
