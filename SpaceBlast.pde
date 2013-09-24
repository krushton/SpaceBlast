import processing.serial.*;

Serial port; // The serial port object

PImage background, backgroundCopy;
int screenSpeed=3;
int backX=0,backY=0,backX2=0,backY2=500;
int PAGE_WIDTH = 500, PAGE_HEIGHT = 500;
boolean scrollBackground = true;
SpaceShip s;
Obstacle[] o;
Game game;
void setup()
{
  // In case you want to see the list of available ports
  println(Serial.list());
  
  // Using the first available port (might be different on your computer)
  port = new Serial(this, Serial.list()[0], 9600); 
  port.bufferUntil('\n');

  size(PAGE_WIDTH, PAGE_HEIGHT);
  background(255);
  background = loadImage("background.gif");
  backgroundCopy = loadImage("background.gif");
  s = new SpaceShip(100,PAGE_HEIGHT-100);
  o = new Obstacle[6];
  for(int i=0; i<6; i++)
  {
    o[i] = new Obstacle();
  }
  game = new Game(o, s.getBullets(), s);
}

void draw()
{
  startBackground();
  s.update();
  game.checkObstacles();
}

void startBackground()
{
  if (scrollBackground) {
      backY += screenSpeed;
      backY2 += screenSpeed;
      
      image(background, backX, backY);
      image(backgroundCopy,backX2,backY2);

      //reached the end of the screen, start again
      if(backY-500>0)
      {
        backY = backY2-1000;
      }
      
      if(backY2-500>0)
      {
        backY2 = backY-1000;
      }
  }
 
}

void stopBackground() {
  scrollBackground = false;
}

void keyPressed() {
   if (key == CODED) {
    if (keyCode == LEFT) {
      s.moveLeft(10);
    } else if (keyCode == RIGHT) {
      s.moveRight(10);
    } 
   } else {
     if (key == 'a') {
         s.fireLeft(5.0);
     } else if (key == 's') {
         s.fireRight(5.0);
     } 
   }
}

void serialEvent(Serial p) {

   // read the serial buffer:
  String myString = port.readStringUntil('\n');
  if (myString != null) {
    //println(myString);
  }
  
  myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    // print out the values you got:
    //for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      //print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t"); 
    //}
    // add a linefeed after all the sensor values are printed:
    //println();
  
  // sent values first three from accelleromter rotation about x, y and z axis
  // make sure there are three values before you use them:
 int xAxisRot = sensors[0];
 float lFireRate = sensors[3];
 float rFireRate = sensors[4];
 
 if (sensors.length > 1) {
     if(xAxisRot > 15){
       s.moveRight(xAxisRot/2);
     } 
     else if(xAxisRot < -15){
       s.moveRight(xAxisRot/2);
     }
     
     println("Left Fire: " + lFireRate + ", Right Fire: " + rFireRate);     
     if(lFireRate > 0){
        s.fireLeft(lFireRate);
     }
     
     if(rFireRate > 0){
        s.fireRight(rFireRate);
     }
 }
}

