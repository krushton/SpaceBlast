
PImage background, backgroundCopy;
int screenSpeed=3;
int backX=0,backY=0,backX2=0,backY2=500;
int WIDTH = 500, HEIGHT = 500;
SpaceShip s;


void setup()
{
  size(WIDTH,HEIGHT);
  background(255);
  background = loadImage("background.gif");
  backgroundCopy = loadImage("background.gif");
  s = new SpaceShip(100,HEIGHT-100);
}

void draw()
{
  startBackground();
  s.update();
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
      s.moveLeft(10);
    } else if (keyCode == RIGHT) {
      s.moveRight(10);
    } 
   }
}


/*
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/24007*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* 
 Group - Spicy Pineapple
 
 Created By Paul Rada, Vanessa Wong, and Raymond Li
 */
 /*
boolean upPressed, leftPressed, downPressed, rightPressed;
boolean wPressed, aPressed, sPressed, dPressed;
boolean finishyMove=true;
boolean p1Ca,p1Cb,p1Cc, p2Ca, p2Cb, p2Cc;
float choiceOrder = (int)random(0,3)+1;
int obx2=(int)random(200,600), oby2=(int)random(-400,-200);
int screenSpeed=3, roadSpeed=10;
int x=500,y=600;
int x2=300,y2=600;
float pSpeed=3.0;
float p2Speed=3.0;
int screenNumber=0;
int getNum1, getNum2;
int pScore,p2Score;
int num1,num2,den1=(int)random(2,6),den2=(int)random(2,5);
float aNum,aDen,aRem,aWho;
int fNum, fDen, fNum2, fDen2;
int err1=(int)random(-3,5),err2=(int)random(-3,5);
int roadx=400,roady=0,roadx2=400,roady2=-1600,finishy=-24000;
PImage obstacle;
PImage car,road,road2,introScreen,p1Lose,finishLine, p1Win,instruction, p2Win,p2Lose,squirrel;
obstacle[] o;
void setup()
{
  size(800,800);
  background(255);
  rectMode(CENTER);
  imageMode(CENTER);
  introScreen = loadImage ("Zsc1.gif");
  car = loadImage ("Car.gif");
  road = loadImage ("road.gif");
  road2 = loadImage ("road.gif");
  p1Lose = loadImage ("LoserSC.gif");
  p1Win = loadImage ("Lastend.gif");
  p2Win = loadImage ("CarWin.gif");
  p2Lose = loadImage("carscr.gif");
  obstacle = loadImage("obstacle.png");
  finishLine = loadImage ("finishLine.gif");
  instruction = loadImage ("Instruc.gif");
  squirrel = loadImage ("SQ1.gif");
  getNum1 = (int)random(1,5);
  getNum2 = (int)random(1,5);

  o = new obstacle[2];
  for(int i=0; i<2; i++)
  {
    o[i] = new obstacle();
  }
}

void draw()
{
  if(screenNumber==0)
  {
    image(instruction,400,400);
    if(mousePressed) screenNumber = 1;
  }
  if(screenNumber==1)
  {
    introduction();
  }
  else if(screenNumber==2)
  {
    if(p2Speed<1.2)
    {
      p2Speed =1.2;
    }

    if(pSpeed<1.2)
    {
      pSpeed=1.2;
    }
    mScreen();
    thePlayer();
    the2Player();
    playerForces();
    y +=screenSpeed;
    y2+=screenSpeed;
    questions();
    answer();
    winLose();
    tip();
    squirrel();
    score();
    for(int i=0; i<2; i++)
    {
      o[i].obstacleFall();
    }
    println(p2Speed);
  }
  else if(screenNumber==4)
  {
    image(p1Win,400,400);
    if(mousePressed)
    {
      screenNumber =1;
      pScore=0;
      p2Score=0;
    }
    finishyMove=true;
    textSize(20);
    text("Your Score is", 150,330);
    text("Car's Score is",510,330);
    textSize(34);
    text(pScore,170,400);
    text(p2Score,545,400);
    x=500; 
    y=600; 
    x2=300; 
    y2=600;
    pSpeed = 3.0;   
    p2Speed = 3.0;
    finishy=-24000;
    roadSpeed=10;
  }
  else if(screenNumber==5)
  {
    image(p2Win,400,400);
    if(mousePressed)
    {
      screenNumber =1;
      pScore=0;
      p2Score=0;
    }
    finishyMove=true;
    textSize(20);
    text("Pink's Score is", 300,530);
    text("Your Score is",500,530);
    textSize(34);
    text(pScore,320,600);
    text(p2Score,545,600);
    x=500; 
    y=600; 
    x2=300; 
    y2=600;
    pSpeed = 3.0;   
    p2Speed = 3.0;
    finishy=-24000;
    roadSpeed=10;
  }
}
*/
