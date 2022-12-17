public class Player {
  PVector pos;
  PVector siz;
  color colour;
  int speed;
  
  public Player (PVector pos, PVector siz, int speed) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.speed = speed;
  }
  
  public Player (PVector pos, PVector siz, int speed, color colour) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.colour = colour;
    this.speed = speed;
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
}
