import controlP5.*;
import milchreis.imageprocessing.*;
import drop.*;

SDrop drop;
ControlP5 cp5;

PImage m, processedImage;
int buttonH;

void setup() {
  size(700, 400);
  frameRate(30);
  background(255);
  cp5 = new ControlP5(this);
  drop = new SDrop(this);
  buttonH = height/6;


  // create buttons
  cp5.addButton("find_edges")
    .setPosition(width-100, 0)
    .setSize(100, buttonH)
    ;

  cp5.addButton("pixelate")
    .setPosition(width-100, buttonH)
    .setSize(100, buttonH)
    ;

  cp5.addButton("clear")
    .setPosition(width-100, buttonH*2)
    .setSize(100, buttonH)
    ;

  cp5.addButton("load_scott")
    .setPosition(width-100, height-buttonH)
    .setSize(100, buttonH)
    ;
    }

void draw() {
  fill(255);
  rect(0, 0, width-100, height);
  fill(0);
  text("drop image here", width/2-100, height/2);
  if (m !=null) {
    m.resize(width-100, 0);
    image(m, 0, 0);
  }
  if (processedImage !=null) {
    m.resize(width-100, 0);
    image(processedImage, 0, 0);
  }
  rect(width-100, 0, 100, height);
}

void dropEvent(DropEvent theDropEvent) {
  println("isFile()\t"+theDropEvent.isFile());
  println("isImage()\t"+theDropEvent.isImage());
  println("isURL()\t"+theDropEvent.isURL());

  // if the dropped object is an image, then 
  // load the image into our PImage.
  if (theDropEvent.isImage()) {
    println("### loading image ...");
    m = theDropEvent.loadImage();
    processedImage = null;
  }
}

public void find_edges() {
  if (m !=null) {
    processedImage = CannyEdgeDetector.apply(m);
  }
}

public void pixelate() {
  if (m !=null) {
    processedImage = Pixelation.apply(m, 5);
  }
}

public void clear() {
  if (m !=null) {
    processedImage = null;
  }
}

public void load_scott() {
    m = loadImage("scott.jpg");
    processedImage = null;
}