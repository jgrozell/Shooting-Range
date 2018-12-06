Reticle player;
ArrayList<Duck> ducks = new ArrayList<Duck>();
//PopupTarget pop = new PopupTarget(100,400);

int numDucks = 25;
float score = 0.0;
float shots = 0.0;
int ammo = 30;
float accuracy = 0;
int s = second();

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
  background(0,200,255);

  
  //pop.display();
  //pop.move();
  
  for(Duck d : ducks) {
    if(d != null) {
      d.display();
      d.move();
    }
  }
  
  player.move(mouseX, mouseY);
  player.display();
  
  // Scoreboard
  if(score > 0) {
    accuracy = score / shots *100;
  }
  fill(0);
  text("Score: " + score, 25, 50);
  text("Shots: " + shots, 25, 75);
  text("Accuracy: " + accuracy + "%", 25, 100); 
  text("Ammo: " + ammo, 25, 125);
  player.bulletLine(ammo);
  
  // End Game
  if(numDucks == 0) {
    fill(0);
    rect(0,0,width,height);
    fill(255);
    textAlign(CENTER,CENTER);
    text("You Win!!!",width/2,height/2);
    text("Shots: " + shots, width/2, height/2 +25);
    text("Accuracy: " + accuracy + "%", width/2, height/2 +50); 
  } 
  //player.barrel();
}

void mousePressed() {
  if(ammo > 0 && numDucks > 0) {
    player.capAss(ducks);
    shots++;
    ammo--;
  }
}

void keyPressed() {
  if(key == 'r') {  
    ammo = 30;
  }
  
}
