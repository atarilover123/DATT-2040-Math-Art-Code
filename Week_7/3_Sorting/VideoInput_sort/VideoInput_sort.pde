import processing.video.*;

Capture video;



void setup() {
  size(600, 600);
  video = new Capture(this, width, height);

  video.start();
}


void draw() {

  if (video.available()) {
    video.read();
    video.pixels = (sort(video.pixels));
    image(video, 0, 0);
  }
}
