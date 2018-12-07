public class PopupTarget {
  
  private PVector pos;
  private PVector vel;
  private int w = 60, h = 60, maxH = -100;
  
  //Time Stuff
  private long mark = 0;
  private long timeBetween = 2000; // ms between popups
  private long timeUp = 1000;
  
  private boolean up = false;
  
  int speed = 2;
  
  public PopupTarget(int x,int y) {
    pos = new PVector(x,y);
    vel = new PVector(6,-6);
  }
  
  public void move() {
    if(millis() - mark > timeBetween) {
      up = true;
      mark = millis();
    }
    
    if(up) {
      if(millis() - mark < timeUp) {
        speed = 10;
      } else {
        up = false;
        mark = millis();
        speed = -10;
      }
    }
    
    pos.add(vel);
    if(pos.x > width) {
      pos.x = 0;
    } 
    vel.y = random(-6,6);
    pos.y = constrain(pos.y,25,height-25);
    
    h -= speed;
    h = constrain(h,maxH,0);
    
  }
  
  public void display() {
    noStroke();
    fill(255,0,0);
    rect(pos.x, pos.y, w, h);
  }
  
  /*public boolean clappinCheeks(Reticle r) {
    float rx = r.getPos().x;
    float ry = r.get
  }*/
}
