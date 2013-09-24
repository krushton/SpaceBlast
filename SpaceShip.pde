class SpaceShip {
  
  PImage ship;
  int xPos;
  int yPos;
  int WIDTH = 69;
  int HEIGHT = 86;
  Blaster blasterLeft;
  Blaster blasterRight;
  private ArrayList<Bullet> bullets;
  
  SpaceShip(int x, int y) {
    xPos = x;
    yPos = y;
    ship = loadImage("ship.png");
    blasterLeft = new Blaster(0, this);
    blasterRight = new Blaster(this.WIDTH-10, this);
    bullets = new ArrayList<Bullet>();
  }
  
  void update() {
    image(ship, xPos, yPos);
  }
  
  void moveLeft(int distance) {
    xPos = xPos - distance >= 0 ? xPos - distance : 0;
    update();
  }
  
  void moveRight(int distance) {
     int dist = xPos + distance;
     xPos = xPos + distance < 430 ? xPos + distance : 430;
     update();
  }
  
  void addBullet(Bullet b) {
     bullets.add(b); 
  }
  
  public ArrayList<Bullet> getBullets() {
     return bullets; 
  }
  
  void fireLeft(float blastSpeed) {
    blasterLeft.setSpeed(blastSpeed);
    blasterLeft.fireBullet();
  }
  
  void fireRight(float blastSpeed) {
    blasterRight.setSpeed(blastSpeed);
    blasterRight.fireBullet();
  }
  
  int getX() {
   return xPos; 
  }
    
  int getY() {
   return yPos; 
  }
  
  int getWidth() {
   return WIDTH;
  }
}
