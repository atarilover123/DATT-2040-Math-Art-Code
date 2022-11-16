//modded from page 24, Generative Art, Matt Pearson

float xstart;
float ynoise ;
void setup() {
  size(800, 800, P3D);
  pixelDensity(2);

  xstart = random(-1000, 1000);
  ynoise = random(-1000, 1000) ;
  rotateY(random(TWO_PI));
  rotateZ(random(TWO_PI));
}

void draw() {
  background(0);
  stroke(0, 50);
  fill(255, 200);
  //float xstart = random(10);
  //float ynoise = random(10);

  translate(width/2, height/2, 0 );
  rotateX(map(mouseX,0,width,0,TWO_PI));
  rotateY(map(mouseY,0,height,0,TWO_PI));


  for (float y = -(height/8); y <= (height/8); y+=3) {
    ynoise += 0.002;
    float xnoise = xstart;
    for (float x = -(width/8); x <= (width/8); x+=3) {
      xnoise += 0.002;
      drawPoint(x, y, noise((x*0.05)+(xnoise)*0.005, (y*0.05)+(ynoise)*0.01));
    }
  }

}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
  float edgeSize = noiseFactor * 26;
  //noStroke();
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}

void mousePressed() {

  xstart = random(-1000, 1000);
  ynoise = random(-1000, 1000) ;
  rotateY(random(TWO_PI));
  rotateZ(random(TWO_PI));
}
