PImage hog;

void setup() {
  size (600,400);
  hog = loadImage("perro.jpg");
  
}

void draw(){
  background (0);
  tint(255,mouseY,mouseY);
  image(hog,0,0, mouseX,mouseY);
  
  //fill(0,255,0);
  //ellipse(300,200,10,10);
}
