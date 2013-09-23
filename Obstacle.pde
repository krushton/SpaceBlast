class Obstacle
{
  boolean dropTrue;
  float obx,oby;
  float obSpeed=15;
  PImage obstacle;
  float x,y;
  float pSpeed=3.0;
  String[] images = {"a1.png", "a2.png", "a3.png", "a4.png", "a5.png"};

  Obstacle()
  {
    obx = random(10,480);
    oby = random(-400,-300);
    int index = int(random(5));
    obstacle = loadImage(images[index]);
    x = s.getX();
    y = s.getY();
  }

  void obstacleChange() {
    int index = int(random(5));
    obstacle = loadImage(images[index]);
  }
  
  void obstacleFall()
  {
    oby += 4;
    image(obstacle,obx,oby);

    if(oby > 500)
    {
      obx = random(180,620);
      oby = random(-500,-300);
      obstacleChange();
    }
    println(obx + " " + oby + " " + x + " " + y);
   println( dist(obx,oby,x,y)+"");
    if(dist(obx,oby,x,y)<20)
    {
      println("collision!");
      obx = random(20,480);
      oby = random(-500,-300);
     
    }
    
  }
}

