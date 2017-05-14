class Ball {

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width -rad) + rad/2);
    y = random((height -rad) + rad/2);
    dx = random(10)-5;
    dy = random(10)-5;
    ellipse(x, y, rad, rad);
    fill(c);
    state = 0;
  }  

  void move() {
    if (state == 0) {
      bounce();
      x = x+dx;
      y = y + dy;
      ellipse(x, y, rad, rad);
      fill(c);
    } else if (state == 1) {
      bigger();
    } else if (state == 2) {
      smaller();
    }
  }

  void bounce() {
    if (y + dy > height || y + dy < 0) {
      dy *= -1;
    }
    if (x + dx > width || x + dx < 0) {
      dx *= -1;
    }
  }

  void bigger() {
    rad += 2;
    if (rad >= 100) {
      state = 2;
    }
    ellipse(x, y, rad, rad);
  }

  void smaller() {
    rad -= 2;
    if (rad <= 0) {
      state = 3;
    }
    ellipse(x, y, rad, rad);      
  }

  void collide( Ball arr) {
      if (arr.state != 0 && arr.state != 3) {
        if (dist(x, y, arr.x, arr.y) <= rad+arr.rad) {
          state = 1;
        }
    }
  }
}