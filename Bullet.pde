public class Bullet {
    private float xPos;
    private float yPos;
    private float fireRate;
    private PImage bullet;
    private Blaster blaster;
    
    Bullet(float x, float y, float rate, Blaster b) {
      xPos = x;
      yPos = y;
      blaster = b;
      fireRate = rate;
      bullet = loadImage("bullet.png");
      registerDraw(this);

    }
    
    void draw() {
      yPos -= fireRate;
      image(bullet,xPos,yPos);
      if (yPos < 0) {
        remove();
      }
    }
  
    public void remove() {
       unregisterDraw(this);
       blaster.ship.bullets.remove(this);
    }
    
    public float getX() {
     return xPos; 
    }
    
    public float getY() {
     return yPos;
    } 
}
