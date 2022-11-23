//created by Dan Tapper, 2019
//reference
/* rectangle packed sliders
 code inspo from: //http://kll.engineering-news.org/kllfusion01/articles.php?article_id=154#here15c
 http://www.jeffreythompson.org/collision-detection/rect-rect.php
 */

//arraylistforsliders
ArrayList<HScrollbar> myhbar = new ArrayList<HScrollbar>();
ArrayList<VScrollbar> myvbar = new ArrayList<VScrollbar>();

// array list of class 
class MyRect {
  int x, y, w, h, curve;
  color rstroke, rfill;

  MyRect(int x, int y, int w, int h, color rstroke, color rfill, int curve) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.rstroke=rstroke;
    this.rfill=rfill;
    this.curve = curve;
  }
  void draw() {

    // pushMatrix();
    fill(rfill);
    //stroke(rstroke);
    noStroke();
    rect(x, y, w, h, curve);
    //popMatrix();
  }
}

ArrayList<MyRect> myrects = new ArrayList<MyRect>();
int x, y, w, h;
int many =300;                          // increase until timeout
int rmin = 5, rmax = 300;                // random w , h range for rect. size
boolean avoid_collide = true; // false;
long stime, dtime=2000;                 // timeout on while

color rf = color(0, 200, 0);
color rs = color(0, 0, 200);

void random_col() {
  int R_low = 100, R_high = 255; 
  int G_low = 100, G_high = 255; 
  int B_low = 100, B_high = 255; 
  rf = color(random(R_low, R_high), random(G_low, G_high), random(B_low, B_high));
  rs = color(random(R_low, R_high), random(G_low, G_high), random(B_low, B_high));
}

void random_set() {
  // random rects
  w = int(random(rmin, rmax));
  h = int(random(rmin, rmax));
  x = int(random(1, width-w-1));
  y = int(random(1, height-h-1));
  random_col();
}

void make_myrects() {
  boolean goon=true;
  myrects = new ArrayList<MyRect>(); 
  myhbar = new ArrayList<HScrollbar>(); 
  myvbar = new ArrayList<VScrollbar>(); 
  // reset
  for (int i=0; i<many; i++) {
    stime = millis();
    random_set();                                                      // init random rect settings
    if ( avoid_collide ) while ( collide(x, y, w, h) && goon ) { 
      random_set();                                                     // try again until not collide with existing
      if ( millis() > stime + dtime ) {      // check timeout
        println("timeout"); 
        goon = false;                        // stop while
        i = many ;                           // stop for loop
      }
    }
    if (goon ) {
      
      //check to see if horizontal or vertical slider
      if (w > h) {
        myhbar.add(new HScrollbar(x, y+(h/2), w, ((w+h)/2)/4, ((w+h)/2)/4)); // H scrollbar
      }

      if (h > w) {
        myvbar.add(new VScrollbar(x+(w/2), y, ((w+h)/2)/4, h, ((w+h)/2)/4)); // V scrollbar
      }


      myrects.add(new MyRect(x, y, w, h, rs, rf, 5));                                // ok, make it
      println("i "+i+" x "+x+" y "+y+" w "+w+" h "+h);
    }
  }
  println("array size: "+myrects.size()+ " of "+many);
}

boolean collide(float r1x, float r1y, float r1w, float r1h) {      // new random rect to test before we make it!!
  if ( myrects.size() > 0) {                         // check on all existing rects if that NEW ONE would collide
    r1x -=1; 
    r1y -=1; 
    r1w +=2; 
    r1h +=2;              // add a pix on all sides
    for ( MyRect onerect : myrects) {
      if (r1x + r1w >= onerect.x &&                  // r1 right edge past r2 left
        r1x <= onerect.x + onerect.w &&              // r1 left edge past r2 right
        r1y + r1h >= onerect.y &&                    // r1 top edge past r2 bottom
        r1y <= onerect.y + onerect.h)                // r1 bottom edge past r2 top
        return true;
    }
  }
  return false;
}

void show_myrects() {
  for ( MyRect onerect : myrects) onerect.draw();
  for (int i = myhbar.size()-1; i >= 0; i--) { 
    HScrollbar hs = myhbar.get(i);
    hs.update();
    hs.display();
  }
  for (int i = myvbar.size()-1; i >= 0; i--) { 
    VScrollbar vs = myvbar.get(i);
    vs.update();
    vs.display();
  }
}

void setup() {
  size(800, 800);
  make_myrects();
  println("use key [r] to regenerate, key [c] toggle collision check, kep [p] to save output");
}

void draw() {
  background(0);
  show_myrects();
}

/*
void mousePressed() {
 // println("make_myrects:");
 // make_myrects();
 }
 */

void keyPressed() {
  if ( key == 'r' ) {
    println("new sliders:");
    make_myrects();
  }
  if ( key == 'c' ) { 
    avoid_collide = ! avoid_collide;
    println("avoid_collide: "+avoid_collide);
  }

  if ( key == 'p' ) { 
    saveFrame("###_out.jpg");
    println("frame " + frameCount + " saved");
  }
}
