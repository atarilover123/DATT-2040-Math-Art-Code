void setup() {
  size(200, 200);
}

float period = 20;
float amplitude = 100;

void draw() {
  background(255);

  float x = amplitude * cos(TWO_PI * frameCount / period);
  stroke(0);
  fill(175);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 20, 20);
  amplitude-=1;
  amplitude = constrain(amplitude,0,100);
}
