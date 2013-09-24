public class ScoreBoard {
    private int score;
    private int lives;
    private float scoreXPos = 20;
    private float scoreYPos = 50;
    private float livesXPos = 450;
    private float livesYPos = 20;
    private ArrayList<PImage> shipImages;
    private Game game;
    private int gameStatus = 0; //game status 0 = not started, 1 = in progress, 2 = finished
    
    public ScoreBoard(int score, int lives, Game game) {
      this.score = score;
      this.lives = lives;
      this.game = game;
      shipImages = new ArrayList<PImage>();
      for (int i = 0; i < lives; i++) {
        shipImages.add(loadImage("small-ship.png"));
      }
      registerDraw(this);
    }
    
    void draw() {
      drawScore();
      drawLives();
      if (gameStatus == 0) {
          drawStartScreen();
      } else if (gameStatus == 2) {
          drawFinishScreen();
      } 
    }
    
    private void drawScore() {
        textSize(32);
        fill(255);
        text(score, scoreXPos, scoreYPos);
    }
    
    private void drawLives() {
        int separator = 0;
        for (int i = 0; i < lives; i++) {
          PImage s = shipImages.get(i);
          image(s, livesXPos - separator, livesYPos);
          separator += 50;
        }
    }
    
    private void drawStartScreen() {
       fill(40, 38, 38);
       rect(0,0,500,500);
       textSize(60);
       fill(255,170,0);
       text("SpaceBlast", 100, 200);
       textSize(20);
       fill(255);
       text("Press any key to start", 130, 280);
    }
    
    private void drawFinishScreen() {
      
       fill(40, 38, 38);
       rect(0, 0,500, 500);
       textSize(60);
       fill(255,170,0);
       text("Game Over", 100, 200);
       textSize(30);
       text("Final Score: " + score, 150, 280);
       textSize(20);
       fill(255);
       text("Press any key to restart", 140, 320);
      
    }
    
    public void updateScore(int newScore) {
       score = newScore; 
    }
    
    public void updateLives(int newLives) {
       lives = newLives; 
    }
   
    
    public void finish() {
       gameStatus = 2; 
    }
    
    public void startUp() {
      gameStatus = 1;
    }
    
    
}
