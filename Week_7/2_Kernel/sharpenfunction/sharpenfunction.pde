//sharpen function
PImage input;

void settings() {
  input = loadImage("broc.jpg");
  size(input.width, input.height);
}

void draw() {
  background(input);

}
void mouseReleased(){
 
  sharpen(input);
}


float[][] kernel =
  {{-1, -1, -1},
   {-1,  9, -1},
   {-1, -1, -1},};

void sharpen(PImage imnam) {

  for (int y = 1; y < imnam.height-1; y++) {
    for (int x = 1; x < imnam.width-1; x++) {

      float sum = 0;
      float sum1 = 0;
      float sum2 = 0;
      float sum3 = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          float nv = 0;

          int pos = (y + ky)*imnam.width + (x + kx);
          float val1 = red(imnam.pixels[pos])+random(-nv, nv);
          float val2 = green(imnam.pixels[pos])+random(-nv, nv);
          float val3 = blue(imnam.pixels[pos])+random(-nv, nv);

          sum1 += kernel[ky+1][kx+1] * val1;
          sum2 += kernel[ky+1][kx+1] * val2;
          sum3 += kernel[ky+1][kx+1] * val3;
        }
      }
      imnam.pixels[y*input.width + x] = color(sum1, sum2, sum3);
    }
  }
}
