public class Client {
  
  Client c;
  String input;
  int[] data;
  
  int maxPlayers = 2;
  int playerNum;
  ArrayList<PVector> positions = new ArrayList<PVector>();
  ArrayList<PVector> sizes = new ArrayList<PVector>();
  ArrayList<Integer> speeds = new ArrayList<Integer>();
  ArrayList<Player> players = new ArrayList<Player>();
  
  color[] colours = new color[]{
    color(0, 255, 0),
    color(255, 0, 0)
  };
  
  void setup () {
    fullScreen();
    c = new Client(this, "127.0.0.1", 12345);
    
    for (int i = 0; i < maxPlayers; i++) {
      positions.add(i, new PVector(500 + i*100, 500));
      sizes.add(i, new PVector(50, 50));
      speeds.add(i, 5);
    }
    
    for (int i = 0; i < positions.size(); i++) {
      players.add(i, new Player(positions.get(i), sizes.get(i), speeds.get(i), colours[i]));
    }
  }
  
  void keyPressed(){
    for (Player p : players) {
      PVector dir = new PVector(0, 0);
      if (key == 'w' || key == 'W') {
        dir.y -= p.speed();
      }
      if (key == 's' || key == 'S') {
        dir.y += p.speed();
      }
      if (key == 'a' || key == 'A') {
        dir.x -= p.speed();
      }
      if (key == 'd' || key == 'D') {
        dir.x += p.speed();
      }
      
      p.move(dir);
    }
    
    
  }
  
  void draw() {
    background(0);
    
    if (c.available() > 0) {
      input = c.radString();
      input = input.substring(0, input.indexOf("\n"));
      data = int(split(input, ' '));
      
      for (int i = 0; i < positions.size(); i++) {
        players.get(i).player();
      }
    }
  }
}
