class Blaster {
    float offset;
    float bulletSpeed;
    float fireRate;
    boolean firing = false;
    ArrayList<Bullet> bullets;
    SpaceShip ship;
    
    Blaster(float off, SpaceShip ss) {
      offset = off;
      ship = ss;
      bulletSpeed = 1.0;
      fireRate = 1.0;
      bullets = new ArrayList<Bullet>();
    }
    
    void fireBullet() {
        Bullet b = new Bullet(ship.getX() + offset, ship.getY(), bulletSpeed, this);
        bullets.add(b);
    }
   
}
