import processing.opengl.*;

PShape model;

float cameraX, cameraY, cameraZ;

void setup(){
  background(0);
  size(displayWidth, displayHeight, OPENGL);
  translate(width/2, height/2, 0);
  cameraX = 250.0;
  cameraY = 250.0;
  cameraZ = 250.0;
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  model = loadShape("mosin.obj");
  model.scale(1.0);
}

void draw(){
  background(0);
  if(keyPressed){
    if(keyCode == LEFT)cameraX -= 10;
    if(keyCode == RIGHT)cameraX += 10;
    if(keyCode == UP)cameraY -= 10;
    if(keyCode == DOWN)cameraY += 10;
    if(keyCode == CONTROL)cameraZ -= 10;
    if(keyCode == SHIFT)cameraZ += 10;
  }
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  stroke(50);
  for(int i = -500;i <= 500;){
    line(-500, i, 0, 500, i, 0);
    line(i, -500, 0, i, 500, 0);
    i += 20;
  }
  lights();
  pushMatrix();
  rotateX(PI/2);
  shape(model);
  popMatrix();
}
