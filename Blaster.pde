class Blaster {
    private float offset;
    private float bulletSpeed;
    private float fireRate;
    private boolean firing = false;
    private SpaceShip ship;
    private float MAX_SPEED = 10.0;
    private float MIN_SPEED = 1.0;
    
    public Blaster(float off, SpaceShip ss) {
      offset = off;
      ship = ss;
      bulletSpeed = 2.0;
      fireRate = 1.0;
    }
    
    void fireBullet() {
        Bullet b = new Bullet(ship.getX() + offset, ship.getY(), bulletSpeed, this);
        ship.addBullet(b);
    }
    
    public void setSpeed(float newSpeed) {
      
      if (newSpeed > MAX_SPEED) {
        bulletSpeed = MAX_SPEED;
      } else if (newSpeed < MIN_SPEED) {
        bulletSpeed = MIN_SPEED;
      } else {
        bulletSpeed = newSpeed;
      }
      
    }
   
}
