import processing.serial.*;

Serial port; // The serial port object

PImage background, backgroundCopy;
int screenSpeed=3;
int backX=0,backY=0,backX2=0,backY2=500;
int WIDTH = 500, HEIGHT = 500;
boolean asteroidHasBeenSeen = false;
SpaceShip s;
Obstacle[] o;

void setup()
{
  // In case you want to see the list of available ports
  //println(Serial.list());
  
  // Using the first available port (might be different on your computer)
  port = new Serial(this, Serial.list()[0], 9600); 
  port.bufferUntil('\n');
  size(WIDTH,HEIGHT);
  background(255);
  background = loadImage("background.gif");
  backgroundCopy = loadImage("background.gif");
  s = new SpaceShip(100,HEIGHT-100);
  o = new Obstacle[6];
  for(int i=0; i<6; i++)
  {
    o[i] = new Obstacle();
  }
}

void draw()
{
  startBackground();
  s.update();
  for(int i=0; i<6; i++)
  {
      o[i].obstacleFall();
  }
}

void startBackground()
{
  backY += screenSpeed;
  backY2 += screenSpeed;
  
  image(background, backX, backY);
  image(backgroundCopy,backX2,backY2);

  if(backY-500>0)
  {
    backY = backY2-1000;
  }
  
  if(backY2-500>0)
  {
    backY2 = backY-1000;
  }
}

void keyPressed() {
   if (key == CODED) {
    if (keyCode == LEFT) {
      s.moveLeft(90);
    } else if (keyCode == RIGHT) {
      s.moveRight(10);
    } 
   }
}

void serialEvent(Serial p) {

   // read the serial buffer:
  String myString = port.readStringUntil('\n');
  if (myString != null) {
    println(myString);
  }
  
  myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    // print out the values you got:
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      //print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t"); 
    }
    // add a linefeed after all the sensor values are printed:
    //println();
  
  // sent values first three from accelleromter rotation about x, y and z axis
  // make sure there are three values before you use them:
 int xAxisRot = sensors[0];
 if (sensors.length > 1) {
     if(xAxisRot > 15){
       s.moveRight(xAxisRot/2);
     } 
     else if(xAxisRot < -15){
       s.moveRight(xAxisRot/2);
     }
 }
}

