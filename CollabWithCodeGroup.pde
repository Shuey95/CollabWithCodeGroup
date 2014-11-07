////http://www.openprocessing.org/sketch/18807
//Credits to: Anne/Shu/Caio/Willie//
//HI

Ball[] ball;
int id;
float x1;
float y1;
float z1;

float noiseScale=0.35;
float mouseZ = 450;


void setup() {

  size(800, 800, P3D);
  smooth();
  frameRate(20);


  ball = new Ball[1600];
  for (int i=0; i < ball.length; i++) {
    ball[i] = new Ball(random(-400, 1200), random(-400, 1200), random(200, -1000), 1);
  }
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      mouseZ -= 15;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      mouseZ += 15;
    }
  }
}

void draw() {

  camera(width/2 + map(mouseX, 0, width, -100, 100), height/2 + map(mouseY, 0, height, -100, 100), 650, width/2, height/2, -100, 0, 1, 1);

  background(25, HSB, 5);
  stroke(1);
  fill(random(150, 255));

  pushMatrix();
  translate(0, 0, mouseZ);
  for (int i = 0; i<360; i+=1) {
    float x1 = mouseX + sin(radians(i))* 60 + map(mouseX, 0, width, -1, 1);
    float y1 = mouseY + cos(radians(i))* 60 + map(mouseY, 0, height, -1, 1);
    noStroke();
    fill(60, 10, 10); 
    ellipse(x1, y1, 15, 15);
  }
  popMatrix();

  for (int j=0; j < ball.length; j++) {
    ball[j].display();
    ball[j].intersection();
    ball[j].drawBall();

    //Planes
    /* should we work a bit on this to make it match the concept a little bit better?
    I dig on what is going on with the points and the intersections...maybe these planes could 
    be incorporated a little better? Right now I feel they make the whole sketch look like a big randomic rainbow
    and takes a lot from the rest of it
    Anyway, it's your guys' call. I don't mind having them.
    I have nothing against randomic rainbows :P just a matter of taste maybe
    
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
     for (int i=0; i < width; i++) {
     float noiseVal = noise((mouseX+x1)*noiseScale, mouseY*noiseScale, random(-1000, 0));
     stroke(noiseVal/100);
     line(x1, mouseY+noiseVal*80, z1, x1, height, z1);
     */
  }
}

class Ball {
  float x;
  float y;
  float z;
  float xSpeed;
  float ySpeed;
  float zSpeed;

  float circleSize;

  Ball(float xPos, float yPos, float zPos, float csize) {
    x = xPos;
    y = yPos;
    z = zPos;
    circleSize = csize;

    xSpeed = random(-1, 1);
    ySpeed = random(-1, 1);
    zSpeed = random(-1, 1);
  }

  void display() {
    x += xSpeed;
    y += ySpeed;
    z += zSpeed;
  }

  void drawBall() {
    stroke(255);
    fill(random(180, 255));
    ellipse(x, y, circleSize+.5, circleSize+.5);
  }

  void intersection() {
    stroke(255, 255, 255, 35);
    for (int i=0; i < ball.length; i++) {
      if (id !=105) {
        if ((dist(x, y, ball[i].x, ball[i].y)<100) && (dist(x, y, mouseX, mouseY)<95) && z - ball[i].z <= mouseZ - 100) {
          colorMode(RGB, 100);
          strokeWeight(0.5);
          line(ball[i].x, ball[i].y, ball[i].z, x, y, z);
        }
      }
    }
  }
}

