public class Reticle {
  
  // variables
  private PVector pos;
  private int w = 50, h = 50;
  
  // constructors
  public Reticle(int x, int y) {
    pos = new PVector(x,y);
  }
  
  //methods
  public void move() {
  }
  
  public void move(int x, int y) {
    pos.x = x;
    pos.y = y;
  }
  
  public void display() {
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(pos.x,pos.y,w,h);
    int add = 5;
    stroke(255,0,0);
    line(pos.x, pos.y -h/2-add, pos.x, pos.y +h/2+add);
    line(pos.x -h/2-add, pos.y, pos.x +h/2+add, pos.y);
  }
  
  /*public void barrel() {
    fill(153);
    quad(width/2+10, height, width/2-10, height, pos.x-10, height-50, pos.x+10, height-50);
  }*/
  
  public void capAss(ArrayList<Duck> ducks) {
    for(int i = 0; i < ducks.size(); i++) {
      Duck duck = ducks.get(i);
      float distance = dist(pos.x, pos.y, ducks.get(i).pos.x, ducks.get(i).pos.y);
      float distanceHead = dist(pos.x, pos.y, ducks.get(i).pos.x, ducks.get(i).pos.y-30);
      int radius = duck.w /2;
      int radHead = duck.wH /2;
      if(distance < radius || distanceHead < radHead) {
        score++;
        ducks.remove(duck);
        numDucks--;
      }
    }
    fill(0,255,0);
    ellipse(pos.x,pos.y,15,15);
  }
  
  public void shottyGun(ArrayList<Duck> ducks) {
    for(int i = 0; i < ducks.size(); i++) {
      Duck duck = ducks.get(i);
      float distance = dist(pos.x, pos.y, ducks.get(i).pos.x, ducks.get(i).pos.y);
      int killZone = duck.w;
      if(distance < killZone) {
        score++;
        ducks.remove(ducks);
        numDucks--;
      }
    }
  }
  
  public void bulletLine(int ammo) {
    int spacing = 25;
      
    for(int i = 0; i < ammo; i++) {
      fill(0);
      noStroke();
      ellipse(spacing+3,140,6,9);
      rect(spacing,140,6,15);
      spacing += 8;
    }
  }
  
}
  
