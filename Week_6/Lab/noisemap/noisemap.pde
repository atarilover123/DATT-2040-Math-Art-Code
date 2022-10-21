PImage noise; 

void setup() {
  
  size(256, 256);
  noise = createImage(width,height,RGB);
}
float inc = 0;
float ns = 0.03;
void draw() {
  inc+=0.01;
  noise.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      
      int loc = i + j *width;
      
      float n = noise(i * ns+inc,j*ns);
      
      noise.pixels[loc] = color(n*255);
      
     // stroke(n*255);
      //point(i,j);
      
    }
  }
  noise.updatePixels();
  image(noise,0,0);
}
