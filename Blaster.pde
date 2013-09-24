class Blaster {
    private float offset;
    private float bulletSpeed;
    private float fireRate;
    private boolean firing = false;
    private SpaceShip ship;
    
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
   
}
