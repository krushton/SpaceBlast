public class Obstacle
{
  boolean dropTrue;
  float obx,oby;
  float obSpeed=15;
  PImage obstacle;
  float x,y;
  float pSpeed=3.0;
  String[] images = {"a1.png", "a2.png", "a3.png", "a4.png", "a5.png"};

  Obstacle() {
    positionObstacle();
    int index = int(random(5));
    obstacle = loadImage(images[index]);
    x = s.getX();
    y = s.getY();
    registerDraw(this);
  }
  
  void positionObstacle() {
    obx = random(10,480);
    oby = random(-400,-300); 
  }

  void changeObstacle() {
    int index = int(random(5));
    obstacle = loadImage(images[index]);
  }
  
  void draw()
  {
    oby += 4;
    image(obstacle,obx,oby);
    
    x = s.getX();
    y = s.getY();

    float dist1 = dist(obx,oby,x,y);
    float dist2 =  dist(obx,oby,x+s.WIDTH,y);
    
    if(dist1 < 40 || dist2 < 5 )
    {
      //collision with ship
      positionObstacle();  
      changeObstacle();
     
    }
    
    if(oby > 500)
    {
      positionObstacle();
      changeObstacle();
    }

    
    
  }
}

