import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage anonymous_img;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  anonymous_img = loadImage("anonymous.png");
  imageMode(CORNER);
  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    image(anonymous_img, faces[i].x, faces[i].y, faces[i].width, faces[i].height );
  }
}

void captureEvent(Capture c) {
  c.read();
}

