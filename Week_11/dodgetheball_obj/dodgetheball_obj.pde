DG[] dodgeball;

int num = 3;
int av = 20;

boolean collide = false;

void setup() {

  dodgeball = new DG[num];


  for (int i = 0; i < num; i++) {
    dodgeball[i] = new DG();
  }

  size(700, 700);
  background(0);
  noStroke();
}

void draw() {

bg();


  for (int i = 0; i < num; i++) {
    dodgeball[i].bb();

    if (PVector.dist(dodgeball[i].loc, dodgeball[i].mouse) <= dodgeball[i].rad) {
      collide = true;
    }
  }

  if (collide) {
    background(0);
    fill(255);
    stroke(255);
    textSize(69);
    text("GAME OVER", width/2-170, height/2);
  }
}

void mousePressed() {

  background(0);
  collide = false;

  dodgeball = new DG[num];

  for (int i = 0; i < num; i++) {
    dodgeball[i] = new DG();
  }
}

void bg() {
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
}
