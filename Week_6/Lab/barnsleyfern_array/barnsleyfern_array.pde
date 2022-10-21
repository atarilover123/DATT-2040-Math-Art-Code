//https://en.wikipedia.org/wiki/Barnsley_fern

float[][] f1 = { {0, 0}, {0, 0.16}             };
float[][] f2 = { {0.85, 0.04}, {-0.04, 0.85}   };
float[][] f3 = { {0.20, -0.26}, {0.23, 0.22}   };
float[][] f4 = { {-0.15, 0.28}, {0.26, 0.24}   };

float[] f = {0, 1.6, 1.6, 0.44};
float[] prob = {0.01, 0.85, 0.93};


//mutated mapping
/*
float[][] f1 = { {0, 0}, {0, 0.25}             };
float[][] f2 = { {0.95, 0.005}, {-0.005, 0.93}   };
float[][] f3 = { {0.035, -0.2}, {0.16, 0.04}   };
float[][] f4 = { {-0.04, 0.2}, {0.16, 0.04}   };

float[] f = {-0.4, 0.5, 0.02, 0.12};
float[] prob = {0.02, 0.84, 0.93};
*/

float x = 0;
float y = 0;

void setup() {
  size(600, 600);
  background(51);
}
void nextPoint() {
  float nextX;
  float nextY;

  float r = random(1);

  if (r < prob[0]) {
    // 1
    nextX =  f1[0][0];
    nextY = f1[1][1] * y;
  } else if (r < prob[1]) {
    // 2
    nextX = f2[0][0] * x + f2[0][1] * y;
    nextY = f2[1][0] * x +  f2[1][1] * y + f[1];
  } else if (r < prob[2]) {
    // 3
    nextX =  f3[0][0] * x + f3[0][1] * y;
    nextY =  f3[1][0] * x + f3[1][1] * y + f[2];
  } else {
    // 4
    nextX = f4[0][0] * x +  f4[0][1] * y;
    nextY =  f4[1][0] * x +  f4[1][1] * y + f[3];
  }

  x = nextX;
  y = nextY;
}

void drawPoint() {
  stroke(255);
  //strokeWeight(2);
  float px = map(x, -2.1820, 2.6558, 0, width);
  float py = map(y, 0, 9.9983, height, 0);
  point(px, py);
}

void draw() {
  for (int i = 0; i < 500; i++) {
    drawPoint();
    nextPoint();
  }
}
