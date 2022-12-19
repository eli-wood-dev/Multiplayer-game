public class Player {
  PVector pos;
  PVector siz;
  color colour;
  int speed;
  int id;
  
  public Player (PVector pos, PVector siz, int speed, int id) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.speed = speed;
    this.id = id;
  }
  
  public Player (PVector pos, PVector siz, int speed, color colour, int id) {
    this.pos = pos.copy();
    this.siz = siz.copy();
    this.colour = colour;
    this.speed = speed;
    this.id = id;
  }
  
  void player() {
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    
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
    return id;
  }
  
  PVector pos() {
    return pos;
  }
}
