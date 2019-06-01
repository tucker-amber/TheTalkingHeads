
// initiate heads

PImage lineImage;
String[] headImages = {"lindaheadshot.png", "rafaelheadshot.png", "amberHeadshot.png"};
boolean head = false;

// current color display
color scolor;

ArrayList<Integer[]> savedColors = new ArrayList<Integer[]>();


String videoPrefix = "project";
int totalFrames = 239;
PImage videoFrame;

String drawingPrefix = "animation-";
PImage drawing;

int currentFrame = 0;
boolean showVideo = true;

PGraphics d;  // Drawing layer

boolean makeLines = false;
int tool = 9;

// UNDO
PGraphics tempD;
boolean undoPressed = false;


void setup() {
  size(1920, 1080);
 
  d = createGraphics(width, height);
  loadFrame();
  loadDrawing();

}

void draw() {
  background(153);
  
  if (showVideo) {
    image(videoFrame, 0, 0, width, height);
  }

  d.beginDraw();
  d.stroke(scolor);
  d.strokeWeight(3);
  if (mousePressed) {
    if (makeLines == true) {
      generateRandomLines(mouseX, mouseY);
    } else if (head == true) {
        d.beginDraw();
        d.image(lineImage, mouseX, mouseY, 30, 30);
        d.endDraw();
      //head = false;
    } else if (tool == 1) {
      tool1();
    } else if (tool == 2) {
      tool2();
    } else if (tool == 3) {
      tool3();
    } else if (tool == 4) {
      tool4();
    } else if (tool == 5) {
      tool5();
    } else if (tool == 6) {
      tool5();
    } else if (tool == 7) {
      tool7();
    } 

    else {
    d.line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  d.endDraw();
  image(d, 0, 0, width, height);

  //currColor(fillRed, fillGreen, fillBlue);
}

// Event Handling -- User key press
void keyPressed() {
  if (key == ' ' ) {
    showVideo = !showVideo;
  } 
  // user changes color values
  if (key == CODED) {
    if (keyCode == LEFT) {  // Left arrow key
      saveAnimationFrame();
      currentFrame--;
      if (currentFrame < 0) {
        currentFrame = totalFrames - 1;
      }
      loadFrame();
      loadDrawing();

    } else if (keyCode == RIGHT) {  // Right arrow key
      saveAnimationFrame();
      currentFrame++;
      if (currentFrame >= totalFrames) {
        currentFrame = 0;
      }
      loadFrame();
      loadDrawing();

    } 
  } 

  // toggle tools on/off
  if (key == '1') {
    tool = 1;
  }
    if (key == '2') {
    tool = 2;
  }
    if (key == '3') {
    tool = 3;
  }
    if (key == '4') {
    tool = 4;
  }
    if (key == '5') {
    tool = 5;
  }
    if (key == '6') {
    tool = 6;
  }
    if (key == '7') {
    tool = 7;
  }
  // color wheel!
  if (key == '0') {
    makeLines = !makeLines;
  }
  if (key == '8') {
    tool = 8;
  }
  if (key == 'l') {
    head = !head;
    lineImage = loadImage(headImages[0]);
  } else if (key == 'r') {
    lineImage = loadImage(headImages[1]);
    head = !head;
  } else if (key == 'a') {
    lineImage = loadImage(headImages[2]);
    head = !head;
  }


}
// 
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

void saveAnimationFrame() {
  d.save(drawingPrefix + nf(currentFrame, 4) + ".png");
  // Clear the drawing layer
  d.beginDraw();
  d.clear();
  d.endDraw();
}

void loadFrame() {
  String filename = videoPrefix + nf(currentFrame, 3) + ".png";
  videoFrame = loadImage(filename);
  println(currentFrame + " / " + (totalFrames-1));
  // following 3 lines draw frame to d layer
  d.beginDraw();
  d.image(videoFrame, 0, 0, width, height);
  d.endDraw();
}

void loadDrawing() {
  try {
    String filename = drawingPrefix + nf(currentFrame, 4) + ".png";
    drawing = loadImage(filename);
    d.beginDraw();
    d.image(drawing, 0, 0, width, height);
    d.endDraw();
  } 
  catch (Exception e) {
    println("You haven't altered this frame yet." + e);
  }
}


void mousePressed() {
    print(mouseX, mouseY);
    println("\n");
}

void drawHead() {
  d.beginDraw();
  image(lineImage, mouseX, mouseY, 30, 30);
  d.endDraw();
}
// yellow lines directed toward far side of screen
void tool1() {
  d.strokeWeight(8);
  d.stroke(255, 238, 41, 250);
  if (mouseX < width / 2) {
    d.line(mouseX, mouseY, random(mouseX, width), random(mouseY - height / 2, mouseY + height / 2));} else
    {d.line(mouseX, mouseY, random(width/ 2, mouseX), random(mouseY - height / 2, mouseY + height / 2)); };
}

// white circle
void tool2() {
  d.strokeWeight(1);
  d.stroke(255, 0, 0);
  d.ellipse(mouseX, mouseY, 25, 25);
}

// multicolor ellipses. random size and location
void tool3() { 
  d.ellipse(random(width), random(height), random(100), random(100));
  d.fill(random(255),random(255),random(255),250);
  d.noStroke();
}

//yellow-green ellipses. random size and location
void tool4() { 
  d.ellipse(random(width), random(height), random(25,50), random(25,50));
  d.fill(random(200,250),random(230,270),random(50,100),250);
  d.strokeWeight(1);
}

// black horizontal line composed of dots
void tool5() { 
   for (int i = -100; i <= 100; i += 10) {
    d.point(mouseX+i, mouseY);
  }
}

void tool6() { 
  d.rect(mouseX, mouseY, 10, 10);
  //layer.square(random(720), random(480), 10);
  d.fill(random(200,250),random(230,270),random(50,100),250);
  d.strokeWeight(1);
}

// small yellow squares. black border
void tool7() {
    d.fill(random(200,250),random(230,270),random(50,100),250);
    float rx = random(-10, 10);
    float ry = random(-10, 10);
    d.rect(mouseX+rx, mouseY+ry, 6, 6);
}
