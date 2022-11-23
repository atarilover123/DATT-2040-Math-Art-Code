float val = 0;
float a = 0;


void draw() {
  background(204);
  strokeWeight(1);
  if (mousePressed) {

    a = atan2(mouseY-height/2, mouseX-width/2);
    val = a;
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(-HALF_PI);

  pushMatrix();

  rotate(val);

  ellipse(0, 0, 60, 60);

  rect(0, -5, 30, 10);
  popMatrix();




  popMatrix();
  println(val);
}
