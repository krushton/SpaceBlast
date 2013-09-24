public class Game  {
 
    private Obstacle[] obstacles;
    private ArrayList<Bullet> bullets;
    private SpaceShip ship;
    private ScoreBoard scoreDisplay;
    private int currentScore = 0;
    private int currentLives = 3;
    private boolean gameIsRunning = false;
    
    public Game(Obstacle[] obstacles, ArrayList<Bullet> bullets, SpaceShip ship) {
       this.obstacles = obstacles;
       this.bullets = bullets;
       this.ship = ship;
       scoreDisplay = new ScoreBoard(currentScore, currentLives, this);
    }

    private void checkObstacles() {
      
        if (gameIsRunning) {
          float shipX = ship.getX();
          float shipY = ship.getY();
  
          for (int i = 0; i < obstacles.length; i++) {
            
            Obstacle o = obstacles[i];
            float obx = o.getX();
            float oby = o.getY();
        
            //check ship v. obstacle
            float obDist1 = dist(obx,oby,shipX,shipY);
            float obDist2 =  dist(obx,oby,shipX + ship.getWidth(),shipY);
                 
            if(obDist1 < 40 || obDist2 < 5 )
            {
              //there was a collision. reset the obstacle.
              o.reset();
              ship.explode();
              //todo: make the spaceship explode and be replaced
              currentLives -= 1;
              if (currentLives == 0) {
                 finishGame();
              }
            }
  
            for (int j = 0; j < bullets.size(); j++) {
               //check bullet v. obstacle
               Bullet b = bullets.get(j);
               float bDist = dist(b.getX(), b.getY(), obx, oby);
               if (bDist < 40) {
                 o.explode();
                 b.remove();
                 currentScore += 10;
               }
            }
          }
          scoreDisplay.updateScore(currentScore);
          scoreDisplay.updateLives(currentLives);
        }
    }
    
    public void startGame() {
       currentScore = 0;
       currentLives = 3;
       gameIsRunning = true;
       scoreDisplay.startUp(); 
    }
    
    public void finishGame() {
       gameIsRunning = false;
       scoreDisplay.finish(); 
    }
    
    public boolean isRunning() {
      return gameIsRunning;
    }
    
}
