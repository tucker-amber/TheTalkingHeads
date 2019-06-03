void whiteCircles() {
  d.strokeWeight(1);
  d.stroke(255, 0, 0);
  d.ellipse(mouseX, mouseY, 25, 25);
}

void multicolorEllipses() { 
  d.ellipse(random(width), random(height), random(100), random(100));
  d.fill(random(255),random(255),random(255),250);
  d.noStroke();
}

void yellowGreenEllipses() { 
  d.ellipse(random(width), random(height), random(25,50), random(25,50));
  d.fill(random(200,250),random(230,270),random(50,100),250);
  d.strokeWeight(1);
}

void blackDots() { 
   for (int i = -100; i <= 100; i += 10) {
    d.point(mouseX+i, mouseY);
  }
}

void smallYellowSquares() {
    d.fill(random(200,250),random(230,270),random(50,100),250);
    float rx = random(-10, 10);
    float ry = random(-10, 10);
    d.rect(mouseX+rx, mouseY+ry, 6, 6);
}

void yellowRays() {
  d.strokeWeight(8);
  d.stroke(255, 238, 41, 250);
  if (mouseX < width / 2) {
    d.line(mouseX, mouseY, random(mouseX, width), random(mouseY - height / 2, mouseY + height / 2));} else
    {d.line(mouseX, mouseY, random(width/ 2, mouseX), random(mouseY - height / 2, mouseY + height / 2)); };
}


void generateRandomLines(int pointA, int pointB)  {
  for (int i = 0; i < 5; i++) {
  int randomA = int(random(-100, 100));
  int randomB = int(random(-100, 100));
  int r = int(random(250));
  int g = int(random(250));
  int b = int(random(250));
  d.stroke(r, g, b);
  d.line(pointA, pointB, pointA - randomA, pointB - randomB);
  }
}
