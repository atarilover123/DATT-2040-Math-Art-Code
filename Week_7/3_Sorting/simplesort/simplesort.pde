PImage img; 

void setup() {
  size(700, 700);

  img = loadImage("broc.jpg");
  img.resize(width, height);
  
  img.pixels = (sort(img.pixels));
  
  background(img);
}

void draw() {
 
}
