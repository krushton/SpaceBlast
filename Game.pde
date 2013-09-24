public class Game  {
 
    private Obstacle[] obstacles;
    private ArrayList<Bullet> bullets;
    private SpaceShip ship;
    private ScoreBoard scoreDisplay;
    private int currentScore = 0;
    private int currentLives = 3;
    
    public Game(Obstacle[] obstacles, ArrayList<Bullet> bullets, SpaceShip ship) {
       this.obstacles = obstacles;
       this.bullets = bullets;
       this.ship = ship;
       scoreDisplay = new ScoreBoard(currentScore, currentLives, this);
    }

    private void checkObstacles() {
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
            //todo: make the spaceship explode and be replaced
            currentLives -= 1;
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
