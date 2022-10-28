PImage img;
color[] c;

void setup() {

}

void settings() {

  img = loadImage("DALLE_OUT.jpg");
  size(img.width, img.height);

  c = new color[img.width];
}

void draw() {

  img.loadPixels();
  for (int i = 0; i < img.width*img.height; i++) {
    
    //update the color array - use modulo to not exceed length of array
    c[i%width] = img.pixels[i];
    c = sort(c);

    //add in a sorting condition - try changing or adding to this to create different effects
    if (hue(img.pixels[i]) >= 100) {

      img.pixels[i] = color(c[i%width]);
    }
  }

  img.updatePixels();

  image(img, 0, 0);

  //try removing noLoop(), see what happens
  noLoop();
}
