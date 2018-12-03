public class Duck {
  private PVector pos;
  private PVector vel;
  private int w = 40, h = 40;
  private float xSpd = random(1,5), ySpd = random(1,5);
  
  public Duck(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(xSpd,ySpd);
  }
  
  void move() {
    pos.add(vel);
    if(pos.x > width) {
      pos.x = 0;
    }
    if(pos.y > height) {
      vel = new PVector(xSpd,-ySpd);
    } else if(pos.y < 0) {
      vel = new PVector(xSpd,ySpd);
    }
  }
  
  void display() {
    fill(255,255,0);
    noStroke();
    ellipse(pos.x,pos.y,w,h);
    ellipse(pos.x+15,pos.y-12,w-5,h-5);
  }
}
