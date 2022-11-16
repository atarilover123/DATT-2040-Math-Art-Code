void setup() {

  size(500, 500, P3D);

  stroke(255);
  
   sphereDetail(20);
}

int sw = 100;
int bs = 40;

float xr;
float yr;
float sv = 1;

void draw() {
  if (keyPressed) {
    sv = map(mouseY, height, 0, 0, 2);
  }
  
  background(0);
  
    text("x rotation: " + xr,40,40);
     text("y rotation: " + yr,40,60);
  pushMatrix();


  translate(width/2, height/2);
  scale(sv);
  
    

  if (mousePressed) {
    xr = map(mouseY, 0, width, 0, TWO_PI);
    yr = map(mouseX, 0, height, 0, TWO_PI);
  }
  

  rotateX((xr));
  rotateY((yr));
  noFill();
  sphere(sw);

  pushMatrix();
  fill(#F50F0F);
  translate((width/2-sw)-bs, 0);
  box(bs);
  popMatrix();

  pushMatrix();
  fill(#0FF533);
  translate(0, (height/2-sw)-bs);
  box(bs);
  popMatrix();

  //

  pushMatrix();
  fill(#0FC1F5);
  translate(-(width/2-sw)+bs, 0);
  box(bs);
  popMatrix();

  pushMatrix();
  fill(#CA0FF5);
  translate(0, -(height/2-sw)+bs);
  box(bs);
  popMatrix();

  popMatrix();
  
}
