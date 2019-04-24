int radius; //for ellipse purposes
int circleX; //starting in the center
int circleY; //starting in the center
int circleSpeed; //how fast it will move when the key is presses
boolean circleIsShrinking = false; //circle is growing at first... if I wanted it to start skrinking this would be true
float c; //c is for color, you can have any variable here 
void setup() {
  size(600, 600);
  ellipseMode(CENTER); //technically you don't need this
  colorMode(HSB); // based on the instructions in the recitation
  frameRate(1000);
  circleX = width/2;
  circleY = height/2;
  radius = 25;
  circleSpeed = 100;
}

void draw() {
  background(255);
  fill(255, 255, 255, 0);
  noStroke(); //I don't want the background to have an outline
  rect(0, 0, width, height); //redrawing the background creates movement

  strokeWeight(10);
  if (c >= 255)  c=0;  
  else  c++; //this cycles through all the colors in the parameters
  stroke(c, 255, 255); //satruation and brightness is the same
  ellipse(circleX, circleY, radius*2, radius*2); ///this is just the size I wanted it... you can have it be whatever size you want


  // Make smaller if shrinking, bigger otherwise (they know if else) 
  if (circleIsShrinking) radius--;
  else radius++;

  // Test if instructions should be reversed (not sure if they know this yet)
  if (radius == 0 || radius == 300) circleIsShrinking = !circleIsShrinking;
}

void keyPressed() //remind people of syntax issues here 
{
  if ( (keyCode == LEFT) && (circleX > radius) )
  {
    circleX = circleX - circleSpeed;
  }

  if ( (keyCode == RIGHT) && (circleX < width-radius) )
  {
    circleX = circleX + circleSpeed;
  }

  if ( (keyCode == UP) && (circleY > radius) )
  {
    circleY = circleY - circleSpeed;
  }

  if ( (keyCode == DOWN) && (circleY < height-radius) )
  {
    circleY = circleY + circleSpeed;
  }
}