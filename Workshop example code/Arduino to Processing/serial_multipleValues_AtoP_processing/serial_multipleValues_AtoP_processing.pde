// IMA NYU Shanghai
// Interaction Lab

/**
 * Based on the readStringUntil() example by Tom Igoe
 * https://processing.org/reference/libraries/serial/Serial_readStringUntil_.html
 */


import processing.serial.*;

String myString = null;
Serial myPort;


int NUM_OF_VALUES = 3;   /** YOU MUST CHANGE THIS ACCORDING TO YOUR PROJECT **/ // This is the number of values you are receiving. 
int[] sensorValues;      /** this array stores values from Arduino **/

int xPos = width/2; 
int yPos = height/2;
int red = 255;
int green = 255;
int blue = 255;

void setup() {
  size(500, 500);
  background(0);

  setupSerial();
  ellipseMode(CENTER);
}


void draw() {
  background(255);
  updateSerial();
  printArray(sensorValues);
  
  xPos = int(map(sensorValues[0], 0, 255, 0, width));
  yPos = int(map(sensorValues[1], 0, 255, 0, height));
  
  fill(red, green, blue);
  stroke(0);
  strokeWeight(5);
  ellipse(xPos, yPos, 100, 100);
  
  if (sensorValues[2] == 1) {
  red = int(random(0, 255));
  green = int (random(0, 255));
  blue = int (random(0, 255));
  }

  // use the values like this!
  // sensorValues[0] 

  // add your code

  //
}



void setupSerial() {
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[ 3 ], 9600);
  // WARNING!
  // You will definitely get an error here.
  // Change the PORT_INDEX to 0 and try running it again.
  // And then, check the list of the ports,
  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
  // and replace PORT_INDEX above with the index number of the port.

  myPort.clear();
  // Throw out the first reading,
  // in case we started reading in the middle of a string from the sender.
  myString = myPort.readStringUntil( '\n' );  // 10 = '\n'  Linefeed in ASCII
  myString = null;

  sensorValues = new int[3];
}



void updateSerial() {
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
    if (myString != null) {
      String[] serialInArray = split(trim(myString), ",");
      if (serialInArray.length == 3) {
        for (int i=0; i<serialInArray.length; i++) {
          sensorValues[i] = int(serialInArray[i]);
        }
      }
    }
  }
}