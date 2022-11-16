//press key
//https://discourse.processing.org/t/peasycam-automatic-camera-movements/20515/2
import peasy.org.apache.commons.math.geometry.*;
import peasy.*;

PeasyCam cam;

public void settings() {
  size(800, 800, P3D);
}

public void setup() {
  cam = new PeasyCam(this, 400);
}

public void draw() {
  background(0);
  box(300);
}

public void keyReleased() {
  if (key == ' ') {
    Rotation rot = new Rotation(RotationOrder.XYZ, random(TAU), random(TAU), random(TAU));
    Vector3D center = Vector3D.zero; // look at the origin (0,0,0)
    double distance = random(500, 1000); // from this far away
    CameraState state = new CameraState(rot, center, distance);
    cam.setState(state, 1000);
  }
}
