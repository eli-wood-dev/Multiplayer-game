public class GameClient {
  
  public GameClient (int port, String ip, int id) {
    this.port = port;
    this.ip = ip;
    this.id = id;
  }
  
  int port;
  String ip;
  int id;
  
  Client c;
  String input;
  int[] data;
  
  ArrayList<PVector> positions = new ArrayList<PVector>();
  ArrayList<PVector> sizes = new ArrayList<PVector>();
  ArrayList<Integer> speeds = new ArrayList<Integer>();
  ArrayList<Player> players = new ArrayList<Player>();
  
  color[] colours = new color[]{
    color(0, 0, 255),
    color(255, 0, 0),
    color(0, 255, 0)
  };
  
  void startClient () {
    c = new Client(this, ip, port);
    
    for (int i = 0; i < id; i++) {
      positions.add(new PVector(500, 500));
      sizes.add(new PVector(50, 50));
      speeds.add(5);
    }
   
    players.add(new Player(positions.get(id), sizes.get(id), speeds.get(id), colours[id], id));
    
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
    
    if (c.available() > 0) {
      input = c.readString();
      input = input.substring(0, input.indexOf("\n"));
      data = int(split(input, ' '));
      
      for (int i = 0; i < positions.size(); i++) {
        players.get(i).player();
      }
    }
  }
}
