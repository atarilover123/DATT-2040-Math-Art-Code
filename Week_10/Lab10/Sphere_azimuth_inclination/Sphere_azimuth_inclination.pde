//https://behreajj.medium.com/3d-rotations-in-processing-vectors-matrices-quaternions-10e2fed5f0a3
//Creating A Vector from Azimuth and Inclination

int longitudes = 32;
int latitudes = 16;

float camdist;
float magnitude;
float invLongitudes;
float invLatitudes;

void setup() {
  size(384, 256, P3D);
  colorMode(HSB, 1.0, 1.0, 1.0, 1.0);
  camdist = height * 0.86602;
  magnitude = min(width, height) * 0.45;

  // Division is more expensive than multiplication,
  // so inverses are cached in setup before using
  // them in draw.
  invLongitudes = 1.0 / float(longitudes);
  invLatitudes = 1.0 / float(latitudes - 1);

  // Test for consistency between 2D and 3D.
  float test = random(TWO_PI);
  println(PVector.fromAngle(test));
  println(fromAngle(test, -HALF_PI));
}

void draw() {
  float camtheta = frameCount * 0.01;

  background(0xffffffff);
  camera(cos(camtheta) * camdist, 0.0, sin(camtheta) * camdist,
    0.0, 0.0, 0.0,
    0.0, 1.0, 0.0);
  strokeWeight(5.0);

  // Use a vector as a short-term container.
  PVector v = new PVector();
  float theta, phi, ipercent, jpercent;
  for (int i = 0, j; i < latitudes; ++i) {
    // Convert progress through inner loop to inclination.
    ipercent = i * invLatitudes;
    phi = PI * ipercent;

    for (j = 0; j < longitudes; ++j) {
      // Convert progress through inner loop to azimuth.
      jpercent = j * invLongitudes;
      theta = TWO_PI * jpercent;

      // Construct unit vector.
      fromAngle(theta, phi, v);
      stroke(jpercent, 1.0, 1.0, 1.0);

      // Set magnitude to sphere's radius.
      v.mult(magnitude);

      // Swap y and z to prop up the globe.
      point(v.x, -v.z, v.y);
      // point(v.x, v.y, v.z);
    }
  }
}

// Supply a new PVector() if the out vector
// has not been initialized beforehand.
PVector fromAngle(float theta, float phi) {
  return fromAngle(theta, phi, new PVector());
}

PVector fromAngle(float theta, float phi, PVector out) {
  float sinphi = sin(-phi);
  return out.set(cos(theta) * sinphi,
    sin(theta) * sinphi,
    cos(-phi));
}
