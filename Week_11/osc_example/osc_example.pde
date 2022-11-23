/*
 * TouchOSC Example displaying values received from
 * TouchOSC "Simple" layout (Page3) xyPad
 */

//Setup OSC Libraries
import oscP5.*;
import netP5.*;
OscP5 oscP5;

//TouchOSC display recreation variables
boolean xyPadNeedsRedraw = true;
float xPos= 120, yPos = 120; 

//accelerometer values
float ax, ay, az;

void setup() {
  size(350, 350);
  background(0);
  noStroke();

  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this, 8000);
}

void oscEvent(OscMessage theOscMessage) {
  String addr = theOscMessage.addrPattern();     
  //println(addr);   // uncomment for seeing the raw message

  if (addr.indexOf("/3/xy") !=-1) { // the X Y area
    xPos =  (theOscMessage.get(0).floatValue());
    yPos =  (theOscMessage.get(1).floatValue());
    //    println(" x = "+xPad+" y = "+yPad);  // uncomment to see x & Y values
    xyPadNeedsRedraw = true;
  }

  //accelerometer values
  if (addr.indexOf("/accxyz") !=-1) { 
    ax = map((theOscMessage.get(0).floatValue()), -1, 1, 0, width);
    ay = map((theOscMessage.get(1).floatValue()), -1, 1, 0, height);
    az = map((theOscMessage.get(2).floatValue()), -1, 1, 0, 100);
  }
}
float lx = 0, ly = 0;
void draw() {
  background(0);

  int x1 =  int(xPos*height);
  int y1 =  int(yPos*width);
noStroke() ;
  fill(x1, y1, az);
  ellipse(x1, y1, 20, 20);

  ellipse(lerp(ax, lx, 0.5), lerp(ay, ly, 0.5), 35, 35);
  
  if(dist(x1, y1,lerp(ax, lx, 0.5), lerp(ay, ly, 0.5)) <= 100){
    
    stroke(255);
    line(x1, y1,lerp(ax, lx, 0.5), lerp(ay, ly, 0.5));
    
  }



  lx = ax;
  ly = ay;
}
