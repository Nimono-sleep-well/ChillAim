import processing.opengl.*;

PShape model;
PShape bg;

PImage mosin;
PImage chain;

float cameraX, cameraY, cameraZ;

float cameraAngX, cameraAngY, cameraAngZ;

float angleXZ, angleY;

float picSZ = 2.0;

int i = 0;
int j = 0;

void setup(){
  
  load();
  
  background(255);
  size(displayWidth, displayHeight, P3D);
  //fullScreen(P3D);
  translate(width/2, height/2, 0);
  
  cameraX = 0.0;
  cameraY = 0.0;
  cameraZ = 0.0;
  
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  
  filter(BLUR, 3);
  
  
  /*
  for(i=0;i<10;i++){
    translate(random(1));
  }
  */
}

void draw(){
  
  j += 1;
  
  draw_space();  //setup space
  
  move();        //control camera
  
  UI();          //draw UI
  
  draw_models();
  
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
  
  angleXZ = asin((mouseY - height/2)/(float)height);
  angleY = acos((mouseX - width/2)/(float)width/2);
  
  cameraAngX = cameraX + ((float)height * cos(angleXZ));
  cameraAngY = cameraY + ((float)width * cos(angleY));
  
  //cameraAngX = mouseX - (float)width/2;
  //cameraAngY = -(float)height * cos(angle);
  
  cameraAngZ = cameraZ + (-(float)height * sin(angleXZ * 2));
  
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

void UI(){
  beginShape();
  texture(mosin); 
  vertex(cameraAngX-(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,0,0); //V1
  vertex(cameraAngX+(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,1024,0); //V2
  vertex(cameraAngX+(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,1024,576); //V3
  vertex(cameraAngX-(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,0,576);
  endShape();
}

void draw_models(){
  /*
  pushMatrix();
  rotateX(PI/2);
  translate(0, 0, 0);
  shape(model);
  popMatrix();
  */
  
  beginShape();
  texture(mosin); 
  vertex(cameraAngX-(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,0,0); //V1
  vertex(cameraAngX+(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,1024,0); //V2
  vertex(cameraAngX+(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,1024,576); //V3
  vertex(cameraAngX-(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,0,576);
  endShape();
}

void load(){
  model = loadShape("naotiki_mh.obj");
  model.scale(600.0);
  /*
  bg = loadShape("HDR.obj");
  bg.scale(100.0);
  */
  mosin = loadImage("fps_mosin_dot.png");
  textureMode(IMAGE);
  chain = loadImage("chainsawman.png");
  textureMode(IMAGE);
}
