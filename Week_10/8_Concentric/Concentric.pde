import peasy.org.apache.commons.math.geometry.*;
import peasy.*;
PeasyCam cam;

void setup() {
  size(500, 500, P3D);
  pixelDensity(2);
  cam = new PeasyCam(this, 400);
  noFill();
}

void draw() {
  background(255);

  int np = 360;
  int layers = 100;

  int c_rad = 400;

  for (int layer = 0; layer < layers; layer++) {

    np = int(map(layer, 0, layers, 0, 180));
    // np = int(map(sin(layer*0.5), -1,1,0,360));

    beginShape();
    for (int i = 0; i < np; i++) {

      float scaler = map(layer, 0, layers, 0, 1);

      float x = sin((i)*TWO_PI/np)*(c_rad*scaler);
      float y = cos((i)*TWO_PI/np)*(c_rad*scaler);
      float z = layer*1.1;
    strokeWeight(1+scaler*1.2);
      //point(x, y, z);
      vertex(x, y, z);
    }
    endShape(CLOSE);
  }
}

void keyReleased() {
  if (key == ' ') {
    //Rotation rot = new Rotation(RotationOrder.XYZ, random(1), random(1), random(TAU));
    Rotation rot = new Rotation(RotationOrder.XYZ, 0, 0, random(TAU));


    Vector3D center = Vector3D.zero; // look at the origin (0,0,0)
    double distance = random(100, 1000); // from this far away
    CameraState state = new CameraState(rot, center, distance);
    cam.setState(state, 1000);
  }
}
