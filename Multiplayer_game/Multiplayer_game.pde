import processing.net.*;

boolean playing = false;
boolean server = false;
boolean started = false;
boolean otherPlayer = false;

int id;

ArrayList<Player> players = new ArrayList<Player>();

PVector startingPos, siz, dir;

int speed = 5;



Server s;
Client c;
String input;
int[] data;

void setup () {
  fullScreen();
  startingPos = new PVector(100, 100);
  siz = new PVector(50, 50);
  dir = new PVector(0, 0);
}
  
void keyPressed(){
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
  speedCap(dir, players.get(id).speed());
}

void keyReleased() {
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    dir.y = 0;
  }
  if (key == 'a' || key == 'A' || key == 'd' || key == 'D') {
    dir.x = 0;
  }
}

void draw() {
  background(0);
  if (!playing) {
    startMenu();
  } else {
    if (server) {
      if (!started) {
        id = 0;
        s = startServer(12345);
        started = true;
      }
      
      players.get(id).move(dir);
      
      s.write(info(players.get(id)));
      
      
      c = s.available();
      if (c != null) {
        input = c.readString();
        input = input.substring(0, input.indexOf("\n"));
        data = int(split(input, ' '));
        if (!otherPlayer) {
          addPlayer(data);
          otherPlayer = true;
        }
      }
      
      for (int i = 0; i < players.size(); i++) {
        players.get(i).player();
        if (players.get(i).id != id) {
          setPosition(data, players.get(i));
        }
      }
      
    } else {
      if (!started) {
        id = 1;
        c = startClient(12345, "66.207.116.198");
        started = true;
      }
      
      if (c.available() > 0) {
        input = c.readString();
        input = input.substring(0, input.indexOf("\n"));
        data = int(split(input, ' '));
        if (!otherPlayer) {
          addPlayer(data);
          otherPlayer = true;
        }
      }
      
      players.get(id).move(dir);
      
      c.write(info(players.get(id)));
      
      for (int i = 0; i < players.size(); i++) {
        players.get(i).player();
        if (players.get(i).id != id) {
          setPosition(data, players.get(i));
        }
      }
    }
  }
}

void startMenu() {
  fill(255, 0, 0);
  rect(100, 100, 100, 100);
  fill(0, 0, 255);
  rect(300, 100, 100, 100);
  if(mousePressed && mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 200) {
    playing = true;
    server = true;
  }
  if(mousePressed && mouseX >= 300 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200) {
    playing = true;
  }
}

Server startServer (int port) {
  color colour = color(0, 0, 255);
  players.add(new Player(startingPos, siz, speed, colour, id));
  
  return new Server(this, port);
}

Client startClient (int port, String ip) {
  color colour = color(255, 0, 0);
  players.add(new Player(startingPos, siz, speed, colour, id));
  
  return new Client(this, ip, port);
}

void addPlayer(int[] data) {
  PVector siz = new PVector(data[2], data[3]);
  color colour = color(0, 0, 255);
  players.add(new Player(startingPos, siz, data[4], colour, data[5]));
}

void setPosition(int[] data, Player p) {
  p.pos.x = data[0];
  p.pos.y = data[1];
}

void speedCap(PVector dir, int speed) {
  if(dir.x > speed) {
    dir.x = speed;
  }
  if(dir.x < -speed) {
    dir.x = -speed;
  }
  if(dir.y > speed) {
    dir.y = speed;
  }
  if(dir.y < -speed) {
    dir.y = -speed;
  }
}

String info (Player p) {
  String info = p.pos.x + "" + p.pos.y + " " + p.siz.x + " " + p.siz.y + " " + p.speed + " " + p.id;
  
  return info;
}
