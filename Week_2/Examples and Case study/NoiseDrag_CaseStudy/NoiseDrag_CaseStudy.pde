//Raven Kwok aka Guo, Ruiwen
//ravenkwok.com
//twitter.com/ravenkwok
//vimeo.com/ravenkwok
//ravenkwok.tumblr.com
//flickr.com/photos/ravenkwok

//mods made by Dan Tapper 15/09/22
//original: https://openprocessing.org/sketch/1624111

ArrayList<Particle> pts;
boolean onPressed, BG = true;
void setup() {
  size(600, 600);
  smooth();
  //colorMode(HSB);
  rectMode(CENTER);

  pts = new ArrayList<Particle>();

  background(0);
}

void draw() {
  if (BG) ;

  if (onPressed) {
    for (int i=0; i<10; i++) {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }
  }

  for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    } else {
      p.update();
      p.display();
    }
  }
}

//input/controls

void mousePressed() {
  onPressed = true;
  if (BG) {
    background(0);
    BG = false;
  }
}

void mouseReleased() {
  onPressed = false;
}

void keyPressed() {
  if (key == 'c') {
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      pts.remove(i);
    }
    background(0);
  }

  if (key == 's') {
    save("out.png");
  }
}
