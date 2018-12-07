public class Duck {
  private PVector pos;
  private PVector vel;
  private int w = 40, h = 40;
  private int wH = 30, hH =30;
  private float xSpd = random(1,5), ySpd = random(1,5);
  
  public Duck(int x, int y) {
    pos = new PVector(x,y);
    vel = new PVector(xSpd,-ySpd);
  }
  
  /*void move() {
    pos.add(vel);
    if(pos.x > width) {
      pos.x = 0;
    }
    if(pos.y > height) {
      vel = new PVector(xSpd,-ySpd);
    } else if(pos.y < 0) {
      vel = new PVector(xSpd,ySpd);
    }
  }*/
  
  void move() {
    pos.add(vel);
    if(pos.y < 0) {
      pos.y = height;
    }
    if(pos.x > width) {
      vel = new PVector(-xSpd,-ySpd);
    } else if(pos.x < 0) {
      vel = new PVector(xSpd,-ySpd);
    }
  }
    
  
  void display() {
    fill(200,100,0);
    noStroke();
    triangle(pos.x,pos.y-50,pos.x-10,pos.y-40,pos.x+10,pos.y-40); // beak
    fill(0,100,0);
    noStroke();
    ellipse(pos.x,pos.y-30,wH,hH); // head
    fill(100,0,0);
    stroke(255);
    strokeWeight(3);
    triangle(pos.x,pos.y-20,pos.x-75,pos.y-30,pos.x-10,pos.y+15); // lower left wing
    triangle(pos.x,pos.y-20,pos.x-75,pos.y-40,pos.x-10,pos.y+15); // upper left wing
    triangle(pos.x,pos.y-20,pos.x+75,pos.y-30,pos.x+10,pos.y+15); // lower right wing
    triangle(pos.x,pos.y-20,pos.x+75,pos.y-40,pos.x+10,pos.y+15); // upper right wing
    triangle(pos.x,pos.y,pos.x-1,pos.y+35,pos.x-30,pos.y+20); // left tail
    triangle(pos.x,pos.y,pos.x+1,pos.y+35,pos.x+30,pos.y+20); // right tail
    triangle(pos.x,pos.y,pos.x-15,pos.y+35,pos.x+15,pos.y+35); // center tail
    ellipse(pos.x,pos.y,w,h); // main body
    
    
  }
}
