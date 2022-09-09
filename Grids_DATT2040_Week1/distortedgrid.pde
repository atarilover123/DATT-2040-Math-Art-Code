color col[][];
int gap = 10;

void setup() {

  //rectMode(CENTER);

  size(700, 700);
  background(0);

  col = new color[width/gap][height/(gap*3)];

  for (int i = 0; i < width/gap; i++) {
    for (int j = 0; j < height/ (gap*3); j++) {
      col[i][j] = color(random(255), random(255), random(255));
    }
  }
}


int ix;
int iy; 

void draw() {

  strokeWeight(1);

  background(0);
  for (int j = 1; j < height; j+=gap) {
    ix++;

    for (int i = 1; i < width; i+=gap) {
      iy++;
      float n = (noise((i+j)*(frameCount*0.00005))*gap);
      float n2 = (noise((j*3)*(frameCount*0.00001))*(gap*3));

      noStroke();
      fill(col[iy%(width/gap)][ix%(height/(gap*3))]);
      rect((-gap/2)+i+n, j, (gap*(n*2)), -(n2*2));
    }
  }

  ix = ix%width/gap;
  iy = iy%width/(gap*3);

  strokeWeight(30);
  stroke(0);
  noFill();
  rect(0, 0, width, height);

  strokeWeight(1);
  stroke(255);
  noFill();
  rect(15, 15, width-30, height-30);
}

