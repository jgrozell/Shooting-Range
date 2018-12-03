Reticle player;
ArrayList<Duck> ducks = new ArrayList<Duck>();
//ArrayList<Bullet> clip = new ArrayList<Bullet>();
int numDucks = 40;
int score = 0;
int shots = 0;

void setup() {
  textSize(25);
  size(800,600);
  noCursor();
  player = new Reticle(width/2, height/2);
  
  for(int i = 0; i < numDucks; i++) {
    ducks.add(new Duck(-i * 100, (int)(random(200,height-200))));
  }
}

void draw() {
  background(255);
  
  for(Duck d : ducks) {
    if(d != null) {
      d.display();
      d.move();
    }
  }
  
  player.move(mouseX, mouseY);
  player.display();
  
  fill(0);
  text("Score: " + score, 50, 50);
  text("Shots: " + shots, 50, 75);
}

void mousePressed() {
  player.capAss(ducks);
  shots++;
}
