Ball[] fs = new Ball[75];

void setup() {
  size(500, 500, P2D);
  smooth(8);
  frameRate(25);
  blendMode(DARKEST);
  
  noStroke();
  fill(0);
  for (int i = 0; i < fs.length; i++) {
    fs[i] = new Ball();
  }
}

void draw() {
  float t = map(frameCount-1, 0, 60, 0, 1) % 1.0;
  
  background(255);
  for (int i = 0; i < fs.length; i++) {
    fs[i].paint(t);
  }
  
}

class Ball {
  PVector center = new PVector();
  float xOff = random(66, 133);
  float cOff = random(0, TAU);
  float rad = random(44, 88);
  
  float rot = random(-0.5, 0.5);
  
  Ball() {
    center.x = 250 + random(-104, 104);
    center.y = 250 + random(-104, 104);
    float maxx = min(center.x, abs(center.x-500));
    xOff = random(66, min(maxx-rad/2, 133));
  }
  
  void paint(float t) {
    float x = sin(t*TAU + cOff) * xOff;
    float r = map(cos(t*TAU+cOff), -1, 1, 0.3, 1) * rad;
    float bo = map(cos(t*TAU+cOff), -1, 1, 66, 0);
    pushMatrix();
    pushStyle();
    fill (bo);
    translate(center.x, center.y);
    rotate(rot);
    ellipse(x, 0, r, r);
    popStyle();
    popMatrix();
  }
}