public class ScoreBoard {
    private int score;
    private int lives;
    private float scoreXPos = 20;
    private float scoreYPos = 50;
    private float livesXPos = 450;
    private float livesYPos = 20;
    private ArrayList<PImage> shipImages;
    private Game game;
    
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
    }
    
    private void drawScore() {
        textSize(32);
        fill(255);
        text(score, scoreXPos, scoreYPos);
    }
    
    private void drawLives() {
        int separator = 0;
        for (int i = lives; i > 0; i--) {
          PImage s = shipImages.get(i);
          image(s, livesXPos - separator, livesYPos);
          separator += 50;
        }
    }
    
    public void updateScore(int newScore) {
       score = newScore; 
    }
    
    public void updateLives(int newLives) {
       lives = newLives; 
    }
    
}
