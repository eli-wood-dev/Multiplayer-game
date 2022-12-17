public class Player {
  PVector pos;
  PVector siz;
  color colour;
  int speed;
  int playerNum;
  
  public Player (PVector pos, PVector siz, int speed, int playerNum) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.speed = speed;
    this.playerNum = playerNum;
  }
  
  public Player (PVector pos, PVector siz, int speed, color colour, int playerNum) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.colour = colour;
    this.speed = speed;
    this.playerNum = playerNum;
  }
  
  void player() {
    
    
    
    fill(colour);
    ellipse(pos.x, pos.y, siz.x, siz.y);
  }
  
  void move(PVector dir) {
    pos.add(dir);
  }
  
  int speed() {
    return speed;
  }
  
  int id() {
    return playerNum;
  }
}
