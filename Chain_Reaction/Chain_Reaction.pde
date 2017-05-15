Ball[] balls;

boolean reaction;
int mX;
int mY;

void setup() {
  size(600, 600);
  reaction = false;
  balls = new Ball[25];
  for (int i=0; i< balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (int i=0; i< balls.length; i++) {
    balls[i].move();
    if (reaction) {
      if ((int) dist(balls[i].x, balls[i].y, mX, mY) <= balls[i].rad*1.5) {
        balls[i].state = 1;
      }
      for (int j = 0; j < balls.length; j++) {
        balls[i].collide(balls[j]);
      }
    }
  }
  check();
}


void check() {
  for (int i = balls.length - 1; i >= 0; i--) {
    if (balls[i].state == 3) {
      balls[i] = balls[i+1];
    }
  }
}

double dist( int bX, int bY, int mX, int mY ) {
  return (double)Math.sqrt((Math.pow(bX - mX, 2)) + ((Math.pow(bY - mY, 2))));
}


void mouseClicked() {
  reaction = true;
  mX = mouseX;
  mY = mouseY;
}