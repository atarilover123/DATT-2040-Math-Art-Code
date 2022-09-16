//create PVector Arrays
PVector[] sp;
PVector[] acc;

//how many 
int num = 50;

void setup() {
  size(800, 800);
  
  //create new 
  sp = new PVector[num];
  acc = new PVector[num];
 
 //Populate
  for (int i = 0; i < num; i++) {
    sp[i] = new PVector(random(width), random(height), random(5, 70));
    acc[i] = new PVector(random(-2, 2), random(-2, 2), 0);
  }
  stroke(255);
  noFill();
  background(0);
}

void draw() {
  background(0);

  for (int j = 0; j < num; j++) {
    sp[j].add(acc[j]);

    if ((sp[j].x > width) || (sp[j].x < 0)) {
      acc[j].x = acc[j].x * -1;
    }

    if ((sp[j].y > height) || (sp[j].y < 0)) {
      acc[j].y = acc[j].y * -1;
    }

    ellipse(sp[j].x, sp[j].y, sp[j].z, sp[j].z);
  }
}
