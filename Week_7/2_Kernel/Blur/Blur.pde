/**
 * Blur.
 *
 * A low-pass filter blurs an image. This program analyzes every
 * pixel in an image and blends it with the neighboring pixels
 * to blur the image.
 */

float v = 1.0 / 9.0;
float[][] kernel =
  {{ v, v, v },
  { v, v, v },
  { v, v, v }};

PImage img;

void setup() {
  size(img.width, img.height);
  img = loadImage("broc.jpg"); // Load the original image
  noLoop();
}

void settings() {

  img = loadImage("broc.jpg"); // Load the original image
  size(img.width, img.height);
}

void draw() {
  img.loadPixels();

  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);

  // Loop through every pixel in the image
  for (int y = 1; y < img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) {  // Skip left and right edges

      float sumr = 0; // Kernel sum for red pixel
      float sumg = 0; // Kernel sum for green pixel
      float sumb = 0; // Kernel sum for blue pixel

      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {

          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);

          // calculate r,g,b values
          float valr = red(img.pixels[pos]);
          float valg = green(img.pixels[pos]);
          float valb = blue(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sumr += kernel[ky+1][kx+1] * valr;
          sumg += kernel[ky+1][kx+1] * valg;
          sumb += kernel[ky+1][kx+1] * valb;
        }
      }

      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sumr, sumg, sumb);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  edgeImg.updatePixels();

  image(edgeImg, 0, 0); // Draw the new image
}
