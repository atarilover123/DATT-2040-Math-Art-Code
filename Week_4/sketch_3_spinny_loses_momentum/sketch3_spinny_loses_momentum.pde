PVector origin;
PVector ball;
PVector vel;

float av = 0.9;
float damp = 0.95;

//len of pendulum line
int len = 200;

//starting angle
float angle = PI/4;


void setup() {
  size(600, 600);

  origin = new PVector (width/2, height/2);
  ball = new PVector (width/2, len);
}

void draw() {
  background(255);
  // ball.x = origin.x + len * sin(angle);
  // ball.y = origin.x + len * sin(angle);
  
  ball.set(len * sin(angle), len * cos(angle));
  ball.add(origin);

  line(origin.x, origin.y, ball.x, ball.y);
  ellipse(ball.x, ball.y, 30, 30);
  av *= damp;
  angle-=av;
}

void mousePressed() {
  av = 0.5;
  //float damp = 0.7;
}
