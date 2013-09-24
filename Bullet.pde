public class Bullet {
    float xPos;
    float yPos;
    float fireRate;
    PImage bullet;
    Blaster blaster;
    
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
  
    void remove() {
       unregisterDraw(this);
       blaster.bullets.remove(this);
    }
}
