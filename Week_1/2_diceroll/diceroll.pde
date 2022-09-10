//click to roll Dice

//how many collumns and rows in my grid
int cols = 10;
int rows = 10;

//variables to hold stepsize (spacing in the grid)
int stepx, stepy;

//setup the size of my canvas
void setup() {
  size(500, 500);

  //value of stepsizes
  stepx = (width / cols);
  stepy = (height / rows);

  //set the fill color to 0
  fill(0);
}

//drawing loop -- keeps the sketch running in realtime
void draw() {
}

//trigger our diceroll function
void mouseReleased() {
  diceroll();
}


//variables for column and row position
int col = -1;
int row = 0;

//diceroll function
void diceroll() {

  //each time we call our function col will add 1 to itself
  col++; 

  //if col is bigger than the the number of cols in our grid we return to 0
  //we add 1 to our row position value
  if (col >= cols) {
    col = 0;
    row++;
  }

  //a variable to hold our dice roll -- 
  //we create a random operation to generate random values between 0 - 3

  int dice = int(random(4));
  println(dice);


  //variables for our x and y positions
  float x = col*stepx;
  float y = row*stepy;

  //variable for our linesize
  int linesize = stepx;

  //draw an ellipse 5*5 pixels wide at each xy coordinate.   
  ellipse(x, y, 5, 5);

  //we use switch as a more convenient if else structure
  //we feed switch a variable, in this case our dice variables.
  //if the dice rolls a 0 we select "case 0", if it rolls a 1 "case 1" etc...
  //rolls generate simple line drawings -- up, down, left, right
  switch(dice) {
  case 0: 
    line(x, y, x+linesize, y);
    break;
  case 1: 
    line(x, y, x, y+linesize);
    break;
  case 2: 
    line(x, y, x-linesize, y);
    break;
  case 3: 
    line(x, y, x, y-linesize);
    break;
  }
}
