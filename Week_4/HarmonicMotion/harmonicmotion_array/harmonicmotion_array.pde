//harmonic motion core:
//amp*sin(frameCount/period)

Motion[] M; 
int len = 4;

void setup() {
  size(500, 500);
  background(0);

  M = new Motion[len];

  for (int i = 0; i <len; i++) {
    M[i] = new Motion();
  }
}

void draw() {
  //background(0);
  //fill(0, 90);
  //rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < len; i++) {
    M[i].hm();
    M[i].collision();
  }
  popMatrix();
}

class Motion {
  //float x = random(width);
  //constructor
  float sfval = 0.0001;

  float sfactor1 = random(100)*sfval;
  float sfactor2 = random(100)*sfval;
  float sfactor3 = random(100)*sfval;
  float sfactor4 = random(100)*sfval;

  float amp =random(200, 250);
  float period = random(30, 60);

  float x;
  float y; 

  float x2;
  float y2;

  float xoff = 0;
  float yoff = 0;

  Motion() {
  }

  void hm() {

    x = xoff+sin(frameCount*sfactor1)*amp*sin(frameCount/period);
    y = yoff+cos(frameCount*sfactor2)*amp*cos(frameCount/period);

    x2 = xoff+sin(frameCount*sfactor3)*amp*sin(frameCount/period);
    y2 = yoff-cos(frameCount*sfactor4)*amp*cos(frameCount/period);

    //pushMatrix();
    //translate(width/2, height/2);
    // stroke(255, 20);
    //line(x, y, x2, y2);


    // popMatrix();
  }

  void collision() {

    // pushMatrix();
    //translate(width/2, height/2);

    for (int i = 0; i < len; i++) {
      float dist1 = dist(this.x, this.y, M[i].x, M[i].y);
      float dist2 = dist(this.x2, this.y2, M[i].x2, M[i].y2);

      if (dist1 <= 50 ) {
        stroke(#FF08EF, 150);
        line(this.x, this.y, M[i].x, M[i].y);
        
      
  
      }

      if (dist2 <= 50) {
        stroke(#08F9FF, 150);
        line(this.x2, this.y2, M[i].x2, M[i].y2);
        

  
      }
    }

    // popMatrix();
  }
}
