float x = 100;
float y = 240;

float x1 = 50;
float y1 = 250;

void setup() {

  println("inbuilt function ", dist(x, y, x1, y1));
  println("custom function ", mydist(x, y, x1, y1));

  size(500, 500);
}

int rad = 100;

void draw() {
  background(0);
  float ex = width/2;
  float ey =height/2;

  float mx = mouseX;
  float my = mouseY;
  fill(255);
  ellipse(mx, my, rad, rad);

  if (mydist(ex, ey, mx, my) <= rad) {
    fill(255, 200, 100);
  } else {
    fill(255);
  }

  ellipse(ex, ey, rad, rad);
}

float mydist(float x1, float y1, float x2, float y2) {

  float xp_sub = x1-x2;
  float yp_sub = y1-y2;

  float d = sqrt(sq(xp_sub) + sq(yp_sub));

  return d;
}
