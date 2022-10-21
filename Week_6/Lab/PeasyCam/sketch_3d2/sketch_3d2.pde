import peasy.*;
PeasyCam cam;
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  noFill();
  stroke(255);

  // tdf(300);
  pushMatrix();
  
  rotateX(radians(frameCount*0.1));
  rotateY(radians(frameCount*0.3));
  rotateZ(radians(frameCount*0.7));
  
  tdfs(100);
  popMatrix();
}


void tdf(float r) {

  r*=0.8;

  if (r > 10) {
    pushMatrix();
    translate(-r*2, 0, r);
    box(r);
    popMatrix();

    pushMatrix();
    translate(r*2, 0, -r);
    box(r);
    popMatrix();

    pushMatrix();
    translate(0, -r*2, r);
    box(r);
    popMatrix();

    pushMatrix();
    translate(0, r*2, -r);
    box(r);
    popMatrix();


    pushMatrix();
    translate(0, 0);

    box(r*4);
    popMatrix();

    tdf(r);
  }
}

void tdfs(float r) {

  r*=0.9;

  if (r > 10) {
    pushMatrix();
    translate(0, 0);
    sphereDetail(int(map(r, 0, 150, 1, 6)));
    sphere(r*4);
    popMatrix();

    tdfs(r);
  }
}
