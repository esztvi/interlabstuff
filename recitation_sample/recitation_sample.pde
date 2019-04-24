// only happens once
void setup() {
  size(1000,1000);
  background(50);
  frameRate(3);
  noFill();
  rectMode(CENTER);
}
// void draw is like void loop... this loops until we turn the program off
void draw() {
rect(200, 200, 200, 200);
 fill(random(255));
 rect(200, 400, 200, 200);
 fill(random(255));
 rect(200, 600, 200, 200);
 fill(random(255));
 rect(400, 200, 200, 200);
 fill(random(255));
 rect(400, 400, 200, 200);
 fill(random(255));
 rect(400, 600, 200, 200);
 fill(random(255));
 rect(600, 200, 200, 200);
 fill(random(255));
 rect(600, 400, 200, 200);
 fill(random(255));
 rect(600, 600, 200, 200);
 fill(random(255));
 rect(800, 200, 200, 200);
 fill(random(255));
 rect(800, 400, 200, 200);
 fill(random(255));
 rect(800, 600, 200, 200);
 fill(random(255));
}