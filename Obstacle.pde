public class Obstacle
{
  private float obx,oby;
  private float explosionX = -1000.0, explosionY = -1000.0;
  private int explosionStart = 0;

  PImage obstacle, explosion;
  String[] images = {"a1.png", "a2.png", "a3.png", "a4.png", "a5.png"};

  public Obstacle() {
    positionObstacle();
    int index = int(random(5));
    obstacle = loadImage(images[index]);
    explosion = loadImage("explosion.png");
    registerDraw(this);
  }
 
  public void reset() {
    positionObstacle();
    changeObstacle();
  }
  
  public void explode() {
    explosionStart = millis();
    explosionX = obx;
    explosionY = oby;
    reset();
  }
 
  public float getX() {
    return obx;
  }
 
  public float getY() {
    return oby;
  }   
  
  void draw()
  {
      oby += 4;
      image(obstacle,obx,oby);
      
      if(oby > 500)
      {
        positionObstacle();
        changeObstacle();
      }
      
      if ( millis() < (100 + explosionStart)) {
         drawExplosion();
      } else {
         hideExplosion(); 
      }

 }
 
 private void drawExplosion() {
   image(explosion, explosionX, explosionY);
 }

 private void hideExplosion() {
   image(explosion, -1000, -1000);
 }
 
 private void positionObstacle() {
  obx = random(10,480);
  oby = random(-400,-300); 
 }

 private void changeObstacle() {
  int index = int(random(5));
  obstacle = loadImage(images[index]);
 }
  
 
}

