float x;
float y ;

float lx;
float ly;

boolean colswitch = true;

void setup() {

  size(600, 600);
  x = width/2;
  y = height/2;
  lx = width/2;
  ly = height/2;
  background(0);
  strokeWeight(1);
}

int step = 10;
int num = 3600;


float growth;

int inc = 0;

void draw() {
  // background(0);
  noFill();

  beginShape();


  growth = (frameCount*0.7%400);
  //println(growth);

  for (int i = 0; i <num; i++) {


    if (colswitch == true) {
      stroke(255, 100);
    } else {
      stroke(0, 60);
    }

    x = width/2+sin(i*TWO_PI/num)*(growth+(noise((y*0.1)*sin(frameCount*0.005)*0.5)*step*12));
    y = height/2+cos(i*TWO_PI/num)*(growth+(noise((x*0.1)*sin(frameCount*0.005)*0.5)*step*12));


    //x = constrain(x, 0, width);
    //y = constrain(y, 0, height);

    //ellipse(x, y, 10, 10);

    curveVertex(x, y);
    //line(x, y, lx, ly);

    lx = x;
    ly = y;
  }
  endShape(CLOSE);
  
   if (int(growth) == 398) {

      colswitch = !colswitch;
      println("change color");
    }
}
