
PImage background, backgroundCopy;
int screenSpeed=3;
int backX=0,backY=0,backX2=0,backY2=500;
int PAGE_WIDTH = 500, PAGE_HEIGHT = 500;
boolean scrollBackground = true;
SpaceShip s;
Obstacle[] o;



void setup()
{
  size(PAGE_WIDTH, PAGE_HEIGHT);
  background(255);
  background = loadImage("background.gif");
  backgroundCopy = loadImage("background.gif");
  s = new SpaceShip(100,PAGE_HEIGHT-100);
  o = new Obstacle[6];
  for(int i=0; i<6; i++)
  {
    o[i] = new Obstacle(this);
  }
}

void draw()
{
  startBackground();
  s.update();
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
         s.fireLeft();
     } else if (key == 's') {
         s.fireRight();
     } 
   }
}


