//lets code some cool shit together
//#interactive #rules
//brainstorm --- 3 classes that interact with each other


float x;
float y;
float accRot = 1;
float rot = 0;

void setup() {

  size(800, 800);
  smooth();
}

void draw() {
  rot += accRot;

  background(255);
  noStroke();
  fill(0);
  
  for (int i = 0; i<180; i+=5) {
    float x = mouseX + sin(radians(i+rot))*150;
    float y = mouseY + cos(radians(i+rot))*150;
    ellipse(x, y, mouseX/10, mouseX/10);
  }
}

