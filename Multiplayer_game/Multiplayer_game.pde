import processing.net.*;

boolean playing = false;

ArrayList<PVector> positions = new ArrayList<PVector>();
ArrayList<PVector> sizes = new ArrayList<PVector>();
ArrayList<Integer> speeds = new ArrayList<Integer>();
ArrayList<Player> players = new ArrayList<Player>();

void setup () {
  fullScreen();
}
  
void keyPressed(){
  
}

void draw() {
  background(0);
  if (!playing) {
    startMenu();
  }
  
}

void startMenu() {
  
}

void move(int id){
      PVector dir = new PVector(0, 0);
      if (key == 'w' || key == 'W') {
        dir.y -= players.get(id).speed();
      }
      if (key == 's' || key == 'S') {
        dir.y += players.get(id).speed();
      }
      if (key == 'a' || key == 'A') {
        dir.x -= players.get(id).speed();
      }
      if (key == 'd' || key == 'D') {
        dir.x += players.get(id).speed();
      }
      
      players.get(id).move(dir);
  }
