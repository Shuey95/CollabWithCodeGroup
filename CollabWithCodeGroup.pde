////http://www.openprocessing.org/sketch/18807
//Credits to: Anne/Shu/Caio/Willie//
//HI

Ball[] ball;
int id;
float x;
float y;
float accRot = 1;
float rot = 0;
float noiseScale=0.35;


void setup() {

  size(800, 800, P3D);
  smooth();
  frameRate(20);


  ball = new Ball[1000];
  for (int i=0; i < ball.length; i++) {
    ball[i] = new Ball(random(800), random(800), 2);
  }
}


void draw() {

  rot += accRot;

  background(25, HSB, 5);
  stroke(5);
  fill(random(255));

  for (int i = 3; i<360; i+=20) {
    float x = mouseX + sin(radians(i+rot))*150;
    float y = mouseY + cos(radians(i+rot))*175;
    ellipse(x, y, mouseX/10, mouseX/10);
  }

  for (int j=0; j < ball.length; j++) {
    ball[j].display();
    ball[j].intersection();
    ball[j].checkCollision();
    ball[j].drawBall();

    //Planes
    stroke(height/2, HSB, j); 
    line(mouseX, mouseY, height, j);

    stroke(mouseY, HSB, mouseX/2); 
    line(0, j, mouseX, mouseY);

    stroke(mouseX, HSB, j+mouseY); 
    line(mouseX/2, mouseY/2, height/2, width/2);

    stroke(HSB, mouseY, j+HSB); 
    line(j, height/2, mouseX, mouseY);

    stroke(j, mouseX, HSB+j);
    line(mouseX, mouseY, width/2, j);
  }
  for (int x=0; x < width; x++) {
    float noiseVal = noise((mouseX+x)*noiseScale, 
    mouseY*noiseScale);
    stroke(noiseVal*25);
    line(x, mouseY+noiseVal*80, x, height);
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
    fill(random(0));


    xSpeed = random(-12, 2);
    ySpeed = random(-12, 2);
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

    if ( (y<r) || (y>height*r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawBall() {
    stroke(255);
    fill(random(255));
    ellipse(x, y, circleSize+.5, circleSize+.5);
  }

  void intersection() {
    stroke(1);
    for (int i=0; i < ball.length; i++) {
      if (id !=105) {
        if ((dist(x, y, ball[i].x, ball[i].y)<100) && (dist(x, y, mouseX, mouseY)<95)) {
          colorMode(RGB, 100);
          strokeWeight(.35);
          line(ball[i].x, ball[i].y, x, y);
        }
      }
    }
  }
}

