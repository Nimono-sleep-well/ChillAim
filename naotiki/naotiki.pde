float cameraX = 0.0;
float cameraY = 0.0;
float cameraZ = 0.0;

float cameraAngX;
float cameraAngY;
float cameraAngZ;

float angleX;
float angleY;
float angleZ; 

char text;

void setup(){
  background(255);
  size(displayWidth, displayHeight, P3D);
  //fullScreen(P3D);
  translate(width/2, height/2, 0);
  
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
}
void draw(){
  move();
  draw_space();
  drawAll();
}

void move(){
  if(keyPressed){
    if(key == 's' || key == 'S')cameraX -= 10;
    if(key == 'w' || key == 'W')cameraX += 10;
    if(key == 'a' || key == 'A')cameraY -= 10;
    if(key == 'd' || key == 'D')cameraY += 10;
    if(keyCode == SHIFT)cameraZ -= 10;
    if(key == ' ')cameraZ += 10;
  }
  
  angleZ = asin((mouseY - height/2)/(float)height);
  angleX = acos((mouseX - width/2)/(float)width/2);
  angleY = acos((mouseX - width/2)/(float)width/2);
  
  cameraAngX = cameraX + ((float)width * sin(angleX));
  cameraAngY = cameraY + ((float)width * cos(angleY));
  
  //cameraAngX = mouseX - (float)width/2;
  //cameraAngY = -(float)height * cos(angle);
  
  //cameraAngZ = cameraZ + (-(float)height * sin(angleXZ * 2));
  
  /*
  cameraAngY = mouseX - width/2;
  cameraAngZ = -mouseY + height/2;
  */
  
  camera(cameraX, cameraY, cameraZ, cameraAngX, cameraAngY, cameraAngZ, 0.0, 0.0, -1.0);
}

void draw_space(){
  background(255);
  stroke(50);
  for(int i = -500;i <= 500;){
    line(-500, i, 0, 500, i, 0);
    line(i, -500, 0, i, 500, 0);
    i += 20;
  }
  lights();
}
void drawAll(){
  translate(cameraAngX, cameraAngY, cameraAngZ);
  sphere(30);
}
