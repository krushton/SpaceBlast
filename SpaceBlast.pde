
PImage background, backgroundCopy;
int screenSpeed=3;
int backX=0,backY=0,backX2=0,backY2=500;
int WIDTH = 500, HEIGHT = 500;
boolean asteroidHasBeenSeen = false;
SpaceShip s;
Obstacle[] o;


void setup()
{
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

void generateAsteroid() {
  int location =  int(random(400));
  Asteroid asteroid = new Asteroid(location);
  asteroid.update();
  asteroidHasBeenSeen = true;
  
}

void keyPressed() {
   if (key == CODED) {
    if (keyCode == LEFT) {
      s.moveLeft(10);
    } else if (keyCode == RIGHT) {
      s.moveRight(10);
    } 
   }
}


