class SpaceShip {
  
  PImage ship;
  int xPos;
  int yPos;
  int WIDTH = 69;
  int HEIGHT = 86;
  Blaster blasterLeft;
  Blaster blasterRight;
  private ArrayList<Bullet> bullets;
  private int explosionStart = 0;
  private float explosionX;
  private float explosionY;
  private PImage explosion;
    
  SpaceShip(int x, int y) {
    xPos = x;
    yPos = y;
    ship = loadImage("ship.png");
    blasterLeft = new Blaster(0, this);
    blasterRight = new Blaster(this.WIDTH-10, this);
    bullets = new ArrayList<Bullet>();
    explosion = loadImage("exploded-ship.png");
  }
  
  void update() {
    image(ship, xPos, yPos);
    if ( millis() < (400 + explosionStart)) {
         drawExplosion();
      } else {
         hideExplosion(); 
     }

  }
  
  void move(int distance) {
    //move right
    if (distance < 0) {
      xPos = xPos + distance >= 0 ? xPos + distance : 0;
    } 
    else {  //move left
      xPos = xPos + distance < 430 ? xPos + distance : 430;
    }
    
    println("xpos: " + xPos);
    update();
  }
  
  void addBullet(Bullet b) {
     bullets.add(b); 
  }
  
  public ArrayList<Bullet> getBullets() {
     return bullets; 
  }
  
  void fireLeft() {
    blasterLeft.fireBullet();
  }
  
  void fireRight() {
    blasterRight.fireBullet();
  }
  
  void fireLeft(float input) {
    blasterLeft.setSpeed(input);
    blasterLeft.fireBullet();
  }
  
  void fireRight(float input) {
    blasterRight.setSpeed(input);
    blasterRight.fireBullet();
  }
  
  private void drawExplosion() {
     fill(40, 38, 38);
     noStroke();
     rect(xPos, yPos, WIDTH, HEIGHT);
     image(explosion, explosionX, explosionY);
  }
  
  private void hideExplosion() {
     image(explosion, -1000, -1000);
  }
 
  public void explode() {
    explosionStart = millis();
    explosionX = xPos;
    explosionY = yPos;
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
