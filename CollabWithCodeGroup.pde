//lets code some cool shit together
//#interactive #rules
//brainstorm --- 3 classes that interact with each other
////http://www.openprocessing.org/sketch/18807

Ball[] ball;
int id;
float x;
float y;
float accRot = 1;
float rot = 0;

void setup() {

  size(800, 800);
  smooth();
  ball = new Ball[1000];
  for (int i=0; i < ball.length; i++) {
    ball[i] = new Ball(random(800), random(800), 1);
  }
}

void draw() {
  rot += accRot;

  background(0);
  noStroke();
  fill(250);

  for (int i = 0; i<360; i+=5) {
    float x = mouseX + sin(radians(i+rot))*150;
    float y = mouseY + cos(radians(i+rot))*150;
    ellipse(x, y, mouseX/10, mouseX/10);
  }

  for (int i=0;i < ball.length; i++) {
    ball[i].display();
    ball[i].intersection();
    ball[i].checkCollision();
    ball[i].drawBall();
  }
}

class Ball {
  float x;
  float y;
  float xSpeed;
  float ySpeed;

  float circleSize;

  Ball(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;

    xSpeed = random(-8, 8);
    ySpeed = random(-8, 8);
  }


  void display() {
    x += xSpeed;
    y += ySpeed;
  }

  void checkCollision() {

    float r = circleSize/2;

    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    } 

    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawBall() {

    fill(250);
    ellipse(x, y, circleSize, circleSize);
  }

  void intersection() {
    stroke(250);
    for (int i=0;i < ball.length; i++) {
      if (id !=i) {
        if ((dist(x, y, ball[i].x, ball[i].y)<40) && (dist(x, y, mouseX, mouseY)<110)) {
          line(ball[i].x, ball[i].y, x, y);
        }
      }
    }
  }
}

