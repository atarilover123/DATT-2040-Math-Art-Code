void setup() {
  size(200, 200);
}

float period = 60;
float amplitude = 100;

void draw() {
  background(255);

  float x = amplitude * cos(TWO_PI * frameCount / period);
  float y = amplitude * cos(PI * frameCount / period);
  stroke(0);
  fill(175);
  translate(width/2, height/2);
  line(0, 0, x, y);
  ellipse(x, y, 20, 20);
  amplitude-=0.1;
  amplitude = constrain(amplitude, 0, 100);
}
