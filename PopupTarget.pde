public class PopupTarget {
  
  private PVector pos;
  private int w = 60, h = 60, maxH = -100;
  
  //Time Stuff
  private long mark = 0;
  private long timeBetween = 2000; // ms between popups
  private long timeUp = 1000;
  
  private boolean up = false;
  
  int speed = 0;
  
  public PopupTarget(int x,int y) {
    pos = new PVector(x,y);
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
      
  }
  
  public void display() {
    noStroke();
    fill(255,0,0);
    rect(pos.x, pos.y, w, h);
  }
}
  
