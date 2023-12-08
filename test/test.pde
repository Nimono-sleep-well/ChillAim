import processing.opengl.*;
//import saito.objloader.*;

PShape model;

float cameraX, cameraY, cameraZ;

void setup(){
  background(255);
  size(displayWidth, displayHeight, P3D);
  translate(width/2, height/2, 0);
  cameraX = 250.0;
  cameraY = 250.0;
  cameraZ = 250.0;
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  model = loadShape("minima.obj");
  model.scale(100.0);
}

void draw(){
  int j = 0;
  background(0);
  if(keyPressed){
    if(keyCode == LEFT)cameraX -= 10;
    if(keyCode == RIGHT)cameraX += 10;
    if(keyCode == UP)cameraY -= 10;
    if(keyCode == DOWN)cameraY += 10;
    if(keyCode == CONTROL)cameraZ -= 10;
    if(keyCode == ALT)cameraZ += 10;
    if(keyCode == SHIFT){
      for(j=0;j<1000;j++){
        translate(j, j, j);
      }
    }
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
