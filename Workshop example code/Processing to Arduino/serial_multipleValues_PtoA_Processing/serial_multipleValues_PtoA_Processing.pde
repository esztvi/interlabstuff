// IMA NYU Shanghai
// Interaction Lab


/**
 * This example is to send multiple values from Processing to Arduino.
 * You can find the arduino example file in the same folder which works with this Processing file.
 * Please note that the echoSerialData function asks Arduino to send the data saved in the values array
 * to check if it is receiving the correct bytes.
 **/


import processing.serial.*;

int NUM_OF_VALUES = 4;  /** YOU MUST CHANGE THIS ACCORDING TO YOUR PROJECT **/


float r = 255;
float g = 255;
float b = 255;
int s = 0;

Serial myPort;
String myString;

// This is the array of values you might want to send to Arduino.
int values[] = new int[NUM_OF_VALUES];

void setup() {
  size(400,255);
  background(0);

  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[3], 9600);
  // check the list of the ports,
  // find the port "/dev/cu.usbmodem----" or "/dev/tty.usbmodem----" 
  // and replace PORT_INDEX above with the index of the port

  myPort.clear();
  // Throw out the first reading,
  // in case we started reading in the middle of a string from the sender.
  myString = myPort.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
  myString = null;
}


void draw() {
  background(0);
  if( mouseX < 100){
    r = map(mouseY, 0, 255, 255, 0);
  }
  if( mouseX > 100 && mouseX < 200){
    g = map(mouseY, 0, 255, 255, 0);
  }
  if( mouseX > 200 && mouseX < 300){
    b = map(mouseY, 0, 255, 255, 0);
  } 
  fill(r,0,0);
  rect(0,0,100,255);
  fill(0,g,0);
  rect(100,0,100,255);
  fill(0,0,b);
  rect(200,0,100,255);
  if (mouseX > 300 && mousePressed == true){
    s = 1;
    fill(0);
  }else{
    s = 0;
    fill(255);
  }
  rect(300,0,100,255);

  // changes the values
  
  values[0] = int(r);
  values[1] = int(g);
  values[2] = int(b);
  values[3] = int(s);

  // sends the values to Arduino.
  sendSerialData();

  // This causess the communication to become slow and unstable.
  // You might want to comment this out when everything is ready.
  // The parameter 20 is the frequency of echoing. 
  // The higher this number, the slower the program will be
  // but the higher this number, the more stable it will be.
  echoSerialData(20);
}

void sendSerialData() {
  String data = "";
  for (int i=0; i<values.length; i++) {
    data += values[i];
    //if i is less than the index number of the last element in the values array
    if (i < values.length-1) {
      data += ","; // add splitter character "," between each values element
    } 
    //if it is the last element in the values array
    else {
      data += "n"; // add the end of data character "n"
    }
  }
  //write to Arduino
  myPort.write(data);
}


void echoSerialData(int frequency) {
  //write character 'e' at the given frequency
  //to request Arduino to send back the values array
  if (frameCount % frequency == 0) myPort.write('e');

  String incomingBytes = "";
  while (myPort.available() > 0) {
    //add on all the characters received from the Arduino to the incomingBytes string
    incomingBytes += char(myPort.read());
  }
  //print what Arduino sent back to Processing
  print( incomingBytes );
}