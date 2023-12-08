import processing.opengl.*;

PShape model;

float cameraX, cameraY, cameraZ;

float cameraAngX, cameraAngY, cameraAngZ;

float angle;

int i = 0;
int j = 0;

void setup(){
  background(255);
  size(displayWidth, displayHeight, P3D);
  //fullScreen(P3D);
  translate(width/2, height/2, 0);
  cameraX = 0.0;
  cameraY = 0.0;
  cameraZ = 0.0;
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  model = loadShape("naotiki_mh.obj");
  model.scale(100.0);
  /*
  for(i=0;i<10;i++){
    translate(random(1));
  }
  */
}

void draw(){
  background(0);
  j += 1;
  
  if(keyPressed){
    if(key == 'a' || key == 'A')cameraX -= 10;
    if(key == 'd' || key == 'D')cameraX += 10;
    if(key == 'w' || key == 'W')cameraY -= 10;
    if(key == 's' || key == 'S')cameraY += 10;
    if(keyCode == SHIFT)cameraZ -= 10;
    if(key == ' ')cameraZ += 10;
  }
  
  angle = asin((mouseY - height/2)/(float)height);
  
  //cameraAngX = (float)height * cos(angle);
  //cameraAngY = mouseX - (float)width/2;
  
  cameraAngX = mouseX - (float)width/2;
  cameraAngY = -(float)height * cos(angle);
  
  cameraAngZ = -(float)height * sin(angle * 2);
  
  camera(cameraX, cameraY, cameraZ, cameraAngX, cameraAngY, cameraAngZ, 0.0, 0.0, -1.0);
  stroke(50);
  for(int i = -500;i <= 500;){
    line(-500, i, 0, 500, i, 0);
    line(i, -500, 0, i, 500, 0);
    i += 20;
  }
  lights();
  pushMatrix();
  rotateX(PI/2);
  translate(0, 0, j);
  shape(model);
  popMatrix();
}
