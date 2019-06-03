// initiate heads
PImage lineImage;
String[] headImages = {"lindaheadshot.png", "rafaelheadshot.png", "amberHeadshot.png"};

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

int currentTool = 9;

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
    if (currentTool == 0) {
      generateRandomLines(mouseX, mouseY);
    } //TODO: Separate head drawing tool into discrete method 
      else if (currentTool == 6) {
        d.beginDraw();
        d.image(lineImage, mouseX, mouseY, 30, 30);
        d.endDraw();
    } else if (currentTool == 2) {
      whiteCircles();
    } else if (currentTool == 3) {
      multicolorEllipses();
    } else if (currentTool == 4) {
      yellowGreenEllipses();
    } else if (currentTool == 5) {
      blackDots();
    } else if (currentTool == 7) {
      smallYellowSquares();
    } else if (currentTool == 8) {
        yellowRays();}

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

  // toggle drawing tools on/off
    if (key == '2') {
    currentTool = 2;
  }
    if (key == '3') {
    currentTool = 3;
  }
    if (key == '4') {
    currentTool = 4;
  }
    if (key == '5') {
    currentTool = 5;
  }
    if (key == '7') {
    currentTool = 7;
  }
    if (key == '8') {
    currentTool = 8;
  }
  if (key == '0') {
    currentTool = 0;
  }
  if (key == '8') {
    currentTool = 8;
  }
  if (key == 'l') {
    currentTool = 6;
    lineImage = loadImage(headImages[0]);
  } else if (key == 'r') {
    currentTool = 6;
    lineImage = loadImage(headImages[1]);
  } else if (key == 'a') {
    currentTool = 6;
    lineImage = loadImage(headImages[2]);
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
