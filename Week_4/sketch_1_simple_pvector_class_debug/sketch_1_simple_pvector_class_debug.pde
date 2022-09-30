PVector[] sp;
PVector[] acc;
int num = 50;

void setup() {
  size(800, 800);
  sp = new PVector[num];
  acc = new PVector[num];
  for (int i = 0; i < num; i++) {
    sp[i] = new PVector(random(width), random(height), random(5, 70));
    acc[i] = new PVector(random(-2, 2), random(-2, 2), 0);
  }
  stroke(255);
  noFill();
  background(0);
}

//count the number of circles - for debig
int numcircs = 0;

void draw() {
  numcircs = 0;

  background(0);
  for (int j = 0; j < num; j++) {
    sp[j].add(acc[j]);

    if ((sp[j].x > width) || (sp[j].x < 0)) {
      acc[j].x = acc[j].x * -1;
    }

    if ((sp[j].y > height) || (sp[j].y < 0)) {
      acc[j].y = acc[j].y * -1;
    }

    for (int i = 0; i < num; i++) {
      float d = PVector.dist(sp[j], sp[i]);
      if (d <= 150  ) {

        stroke(255);

        strokeWeight(0.5);
        line(sp[i].x, sp[i].y, sp[j].x, sp[j].y);
      }
      strokeWeight(0.5);

      //fill(255,10,30);
      ellipse(sp[i].x, sp[i].y, sp[i].z, sp[i].z);
      //noStroke();
      //ellipse(sp[i].x, sp[i].y, sp[i].z-j, sp[i].z-j);

      numcircs++;
    }

    //fill(255, 10, 30);
    //ellipse(sp[j].x, sp[j].y, sp[j].z, sp[j].z);
  }

  /*
  //in front of lines
   for (int k = 0; k < num; k++) {
   fill(255, 10, 30);
   ellipse(sp[k].x, sp[k].y, sp[k].z, sp[k].z);
   }
   */

  //println(numcircs);
  println(frameRate);
}
