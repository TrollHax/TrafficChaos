ArrayList<TrafficLight> trafficLights;
ArrayList<Path> paths;

color black = color(0);
color redLight = color(255, 0, 0);
color yellowLight = color(255, 255, 0);
color greenLight = color(0, 255, 0);
color redOff = color(100, 0, 0);
color yellowOff = color(100, 100, 0);
color yellowClear = color(255);
color greenOff = color(0, 100, 0);
float size = 1;
int numOfTLights = 1;
int numOfPaths = 1;

PImage redCircle, yellowCircle, greenCircle, redWalkMan, greenWalkMan;

void setup() {
  size(1920, 1080);
  background(50);

  trafficLights = new ArrayList<TrafficLight>();
  paths = new ArrayList<Path>();

  //redCircle = loadImage("Images/redCircle.png");
  //yellowCircle = loadImage("Images/yellowCircle.png");
  //greenCircle = loadImage("Images/greenCircle.png");
  //redWalkMan = loadImage("Images/redWalkMan.png");
  //greenWalkMan= loadImage("Images/greenWalkMan.png");
  //redCircle.resize(90, 0);
  //yellowCircle.resize(150, 0);
  //greenCircle.resize(140, 0);
  //redWalkMan.resize(75, 0);
  //greenWalkMan.resize(40, 0);

  for (int i = 0; i <numOfTLights; i++) {
    trafficLights.add(new TrafficLight(100*i*4*size, 50, size));
  }
  for (int i = 0; i <numOfPaths; i++) {
    paths.add(new Path());
  }
}


void draw() {

  for (TrafficLight t : trafficLights) {
    t.update();
  }
  for (Path p : paths) {
    p.addPoint(100, 200);
  }
  for (Path p : paths) {
    p.render();
  }
}
