public class GameServer {
  
  public GameServer (int port) {
    this.port = port;
  }
  
  int port;
  Server s;
  Client c;
  String input;
  int[] data;
  
  int id = 0;
  ArrayList<PVector> positions = new ArrayList<PVector>();
  ArrayList<PVector> sizes = new ArrayList<PVector>();
  ArrayList<Integer> speeds = new ArrayList<Integer>();
  ArrayList<Player> players = new ArrayList<Player>();
  
  color colour = color(0, 0, 255);
  
  void startServer() {
    s = new Server(this, port);
    
    positions.add(new PVector(500, 500));
    sizes.add(new PVector(50, 50));
    speeds.add(5);
  
    players.add(new Player(positions.get(id), sizes.get(id), speeds.get(id), colour, id));
  }
    
  void move(){
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
  
  void play() {
    background(0);
    c = s.available();
    if (c != null) {
      input = c.readString();
      input = input.substring(input, input.indexOf("\n"));
      data = int(split(input, ' '));
      
      for (int i = 0; i < positions.size(); i++) {
        players.get(i).player();
      }
    }
  }
}
