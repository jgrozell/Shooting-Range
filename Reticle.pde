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
    stroke(0,0,255);
    line(pos.x, pos.y -h/2-add, pos.x, pos.y +h/2+add);
    line(pos.x -h/2-add, pos.y, pos.x +h/2+add, pos.y);
  }
  
  public void capAss(ArrayList<Duck> ducks) {
    for(int i = 0; i < ducks.size(); i++) {
      Duck duck = ducks.get(i);
      float distance = dist(pos.x, pos.y, ducks.get(i).pos.x, ducks.get(i).pos.y);
      int radius = duck.w /2;
      if(distance < radius) {
        score++;
        ducks.remove(duck);
      }
    }
  }
}
  
