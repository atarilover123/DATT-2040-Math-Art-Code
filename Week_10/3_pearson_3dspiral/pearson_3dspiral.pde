
int radius = 100;
void setup() {
  size(500, 300, P3D);
  pixelDensity(2);
  background(255);
  stroke(0);
}
void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateX(map(mouseX, 0, width, 0, TWO_PI));
  rotateY(map(mouseY, 0, height, 0, TWO_PI));
  
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;

  while (t < 180) {
    s += 18;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius * cos(radianS) * sin(radianT));
    float thisy = 0 + (radius * sin(radianS) * sin(radianT));
    float thisz = 0 + (radius * cos(radianT));
    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}
