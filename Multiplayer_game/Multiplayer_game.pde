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
  fill(255, 0, 0);
  rect(100, 100, 100, 100);
  fill(0, 0, 255);
  rect(300, 100, 100, 100);
  if(mousePressed && mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 200) {
    playing = true;
  }
  if(mousePressed && mouseX >= 300 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200) {
    playing = true;
  }
}
