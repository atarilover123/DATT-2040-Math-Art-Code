PImage fb;
PImage test;
void setup() {
  size(500, 500);
  fb = createImage(width, height, ARGB);
  test = loadImage("pacman.jpg");
  background(0);
  imageMode(CENTER);
  strokeWeight(4);
}

void draw() {

  stroke(255);
  image(fb, width, height/2);

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(frameCount*0.05);

  stroke(frameCount%255, abs(sin(frameCount*0.1)*255), abs(cos(frameCount*0.1)*255));
  strokeWeight(2);
  line(-90, 0, 90, 0);
  strokeWeight(4);
  line(-40, 0, 40, 0);

  popMatrix();
  fb = get();
  pushMatrix();
  scale(abs(sin(frameCount*0.01)));
  translate(width/2,height/2);
  rotate(frameCount*0.001);

  tint(255, 240);
  image(fb, 0, 0);
  popMatrix();
}
