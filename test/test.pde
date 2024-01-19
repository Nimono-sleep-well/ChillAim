import processing.opengl.*;
import processing.video.*;

PShape target_L;
PShape target_R;
PShape bullet;
PShape bg;

PImage mosin;
PImage chain;
PImage pressToStart;

Movie mv;
Movie opening;

int display = 0;
/*
0 -> Opening Movie
1 -> Start display
2 -> Game display
3 -> Result display
4 -> 
*/

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
int targetcount = 0;

void setup(){
  background(255);
  //size(displayWidth, displayHeight, P3D);
  fullScreen(P3D);
  translate(width/2, height/2, 0);
  
  mv = new Movie(this, "ChillAimLogo.mp4");
  mv.loop();
  opening = new Movie(this, "ChillAimOpening.mp4");
  opening.play();
  
  pressToStart = loadImage("PressToStart.png");
  
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
  
  /*
  if(keyPressed){
    if(key == ' ')display += 1;
  }
  */
  
  if(display == 0)opening();
  if(display == 1)startDisp();
  if(display == 2)game();
  if(display == 3)result();
}

void opening(){
  background(0);
  camera(0.01, 0, 935, 0, 0, 0, 0, 0, -1);
  //move();
  opening.read();
  
  rotateZ(radians(-90));
  
  translate(0, -300, 0);
  scale(0.5);
  hint(DISABLE_DEPTH_TEST);
  image(opening, -960, -540);
  hint(ENABLE_DEPTH_TEST);
  scale(1);
  if(j>200)display++;
}

void startDisp(){
  background(0);
  camera(0.01, 0, 935, 0, 0, 0, 0, 0, -1);
  //move();
  mv.read();
  
  rotateZ(radians(-90));
  
  translate(0, -300, 0);
  scale(0.5);
  hint(DISABLE_DEPTH_TEST);
  image(mv, -960, -540);
  hint(ENABLE_DEPTH_TEST);
  scale(1);
  translate(0, 300, 0);
  
  translate(0, 300, 0);
  scale(1);
  hint(DISABLE_DEPTH_TEST);
  image(pressToStart, -960, -540);
  hint(ENABLE_DEPTH_TEST);
  scale(1);
  translate(0, -300, 0);
  rotateZ(radians(90));
  
  scale(1);
}

void game(){
  move();
  textAlign(CENTER, CENTER);
  if(j <= 300){
    rotateY(radians(-90));
    rotateZ(radians(90));
    text(5-j/60, 0, -50, -200); //right, down, temae
    //text(text_info, 0, -200, -200);
    rotateZ(radians(-90));
    rotateY(radians(90));
  }
  else if(j > 300 && j <= 360){
    rotateY(radians(-90));
    rotateZ(radians(90));
    text("GAME START", 0, -50, -200); //right, down, temae
    //text(text_info, 0, -200, -200);
    rotateZ(radians(-90));
    rotateY(radians(90));
  }
  else{
    UI();
    score();
    firing();
  }
  if(targetcount >= 1)display += 1;
}

void result(){
  move();
  fill(0);
  textAlign(CENTER, CENTER);
  rotateY(radians(-90));
  rotateZ(radians(90));
  text("Result", 0, -30, -100);
  text("Score:"+ score, 0, -10, -100);
  rotateZ(radians(-90));
  rotateY(radians(90));
}
