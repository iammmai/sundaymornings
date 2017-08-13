circle c1, c2, c3;

void setup() {
  fullScreen();

  c1 = new circle(width/2, height/2, 50, color(100));
  c2 = new circle(width/3, height/2, 25, color(255, 9, 70));
  c3 = new circle(2*width/3, height/2, 25, color(255));
  filter(BLUR, 4);
}

void draw() {

  background(0);
  c1.interpolate(mouseX, mouseY);
  //c2.interpolate(mouseX+100, mouseY);
  //c1.orbit(width/2, height/2);
  c2.orbit(c1.newX, c1.newY, 200, 120, 500.0f);
  c3.orbit(c2.xpos, c2.ypos, 200, 230, 400.0f);
  c2.orbitDraw(c3.xpos, c3.ypos, 300, 60, 900.0f);
}

class circle {
  float xpos; 
  float ypos;
  float dia;
  color c;
  float newX; 
  float newY;

  circle(float ixpos, float iypos, float idia, color ic) {
    xpos = ixpos;
    ypos = iypos;
    dia = idia;
    c = ic;
  } 

  void display(float x, float y) {
    x = xpos;
    y = ypos;
    fill(c);
    ellipseMode(RADIUS);
    noStroke();
    ellipse(xpos, ypos, dia, dia);
    //filter(BLUR,4);
  }

  void makeColor(color col) {
    col = c;
    fill(col);
    //stroke(c);
  }
  
  void interpolate(float x2, float y2) {
    this.display(newX, newY);
    newX= (lerp(newX, x2, 0.05)); 
    newY= (lerp(newY, y2, 0.05));
    xpos = newX;
    ypos = newY;
    
  }
  

  void orbit(float startX, float startY, int a, int b, float speed ) {

    float  time = millis()/speed;
    int ox = (int)(startX + a* cos(time));
    int oy = (int)(startY + b* sin(time));
    xpos = ox;
    ypos = oy;

    this.display(ox, oy);
  }
  
  }
}