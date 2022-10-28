PImage img; 

void setup() {
  size(700, 700);

  img = loadImage("broc.jpg");
  img.resize(width, height);

  background(img);
}
int inc = 1;
int step = 1;
void draw() {
  image(img, 0, 0);
  if (inc <= (width/2)-2) {
    inc+=step;
    circ(inc, 360*5);
  }
}

void circ(int rad, int steps) {

  color pix[] = new color[steps];

  for (int cols = 0; cols < steps; cols++) {

    float x = width/2+rad*cos(cols*TWO_PI/float(steps));
    float y = height/2+rad*sin(cols*TWO_PI/float(steps));

    int loc = int(x) + int(y) * width;

    pix[cols] = img.pixels[loc];
  }

  img.loadPixels();
  pix = sort(pix);
  for (int angle = 0; angle < steps; angle++) {

    float x = width/2+rad*cos(angle*TWO_PI/float(steps));
    float y = height/2+rad*sin(angle*TWO_PI/float(steps));
    int loc = int(x) + int(y) * width;

    img.pixels[loc] = pix[angle];

  }
  img.updatePixels();
}
