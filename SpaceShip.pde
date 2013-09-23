class SpaceShip {
  
  PImage ship;
  int xPos;
  int yPos;
  
  SpaceShip(int x, int y) {
    xPos = x;
    yPos = y;
    ship = loadImage("ship.png");
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
     println(dist);
     xPos = xPos + distance < 430 ? xPos + distance : 430;
     update();
  }
    
}
