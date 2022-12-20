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
