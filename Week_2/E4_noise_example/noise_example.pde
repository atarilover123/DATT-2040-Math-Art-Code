int cols = 120;
int rows = cols;

float factor = 0.015;
int step;


void setup() {
  fill(255);

  size(600, 600);
  step = (width / cols);
}

float inc = 0;

void draw() {
  background(0);

  float n;

  inc+= 0.006;


  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      n = noise(x * factor, y * factor, inc) *  30;

      //quantize
      // n = (n - int(n)) * 1;

      float  cx = cos(n)*0.3;
      float cy = sin(n)*0.3;
      stroke(255);
      point(x * (step + cx), y * (step + cy));
    }
  }
}
