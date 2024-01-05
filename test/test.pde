import processing.opengl.*;

PShape target_L;
PShape target_R;
PShape bullet;
PShape bg;

PImage mosin;
PImage chain;

float cameraX, cameraY, cameraZ;

float cameraAngX, cameraAngY, cameraAngZ;

float rollX, rollY, rollZ;

float angleXZ, angleY;

float picSZ = 2.0;

float high;

float bX;
float bY = 10000;
float bZ = 0;

float cursorX;
float cursorY;
float cursorZ;

float targetX;
float targetY;
float targetZ;

String text_score;
String text_info;

final float speed = 10;     

final float maxbullet = 5;

int rpm = 30;

int score = 0;

//increment brothers
int i = 0;
int j = 0;
int target_locate = 0;
int repeat = 0;
int rate = 0;
int pointcool;

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
  
  //filter(BLUR, 3);
  
  
  /*
  for(i=0;i<10;i++){
    translate(random(1));
  }
  */
}

void draw(){
  
  j += 1;
  rate += 1;
  
  draw_space();  //setup space
  
  move();
  
  UI();          //draw UI
  
  score();
  
  draw_models();
  
  firing();
}

void move(){
  if(keyPressed){
    if(key == 's' || key == 'S')cameraX -= 10;
    if(key == 'w' || key == 'W')cameraX += 10;
    if(key == 'a' || key == 'A')cameraY -= 10;
    if(key == 'd' || key == 'D')cameraY += 10;
    if(keyCode == SHIFT)cameraZ -= 10;
    if(key == ' ')cameraZ += 10;
    if(key == 'r' || key == 'R')rate = 0;
  }
  
  angleXZ = asin((mouseY - height/2)/(float)height);
  angleY = acos((mouseX - width/2)/(float)height/2);
  
  cameraAngX = cameraX + ((float)height * cos(angleXZ));
  cameraAngY = cameraY + ((float)width * cos(angleY));
  
  //cameraAngX = mouseX - (float)width/2;
  //cameraAngY = -(float)height * cos(angle);
  
  cameraAngZ = cameraZ + (-(float)height * sin(angleXZ * 2));
  
  /*
  cameraAngY = mouseX - width/2;
  cameraAngZ = -mouseY + height/2;
  */
  text_info = "x" + cameraAngX + "\ny" + cameraAngY + "\nz" + cameraAngZ;
  
  camera(cameraX, cameraY, cameraZ, cameraAngX, cameraAngY, cameraAngZ, 0.0, 0.0, -1.0);
}

void draw_space(){
  background(255);
  stroke(50);
  for(int i = -500;i <= 500;){
    line(-500, i, -50, 500, i, -50);
    line(i, -500, -50, i, 500, -50);
    i += 20;
  }
  lights();
}

void UI(){
  /*
  beginShape();
  texture(mosin); 
  vertex(cameraAngX-(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,0,0); //V1
  vertex(cameraAngX+(512 * picSZ),cameraAngY-(288 * picSZ),cameraAngZ,1024,0); //V2
  vertex(cameraAngX+(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,1024,576); //V3
  vertex(cameraAngX-(512 * picSZ),cameraAngY+(288 * picSZ),cameraAngZ,0,576);
  endShape();
  */
  translate(cameraAngX, cameraAngY, cameraAngZ);
  sphere(5);
  translate(-cameraAngX, -cameraAngY, -cameraAngZ);
  fill(0);
  text("Hello World!", 100, 100);
}

void draw_models(){
  
  /*
  pushMatrix();
  rotateX(PI/2);
  translate(0, 0, 0);
  shape(model);
  popMatrix();
  */
  
  /*
  beginShape();
  texture(chain); 
  vertex(-371, 602, -371, 602);
  vertex(371, 602, 371, 602);
  vertex(371, -602, 371, -602);
  vertex(-371, -602, -371, -602);
  endShape();
  */
}

void load(){
  target_L = loadShape("flying_naotiki.obj");
  target_L.scale(30.0);
  
  target_R = loadShape("flying_naotiki_right.obj");
  target_R.scale(30.0);
  
  /*
  bullet = loadShape("bullet.obj");
  bullet.scale(10.0);
  */
  
  /*
  bg = loadShape("HDR.obj");
  bg.scale(100.0);
  
  mosin = loadImage("fps_mosin_dot.png");
  textureMode(IMAGE);
  
  chain = loadImage("chainsawman.png");
  textureMode(IMAGE);
  */
}

void mousePressed(){
  if(mouseButton == LEFT){
    if(rate >= rpm){//oku, up, left
      rate = 0;
      fire();
    }
  }
}
