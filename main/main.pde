import processing.opengl.*;
import processing.video.*;

PShape target_L;
PShape target_R;
PShape bullet;
PShape bg;

PImage mosin;
PImage chain;
PImage pressToStart;
PImage scoreboard;
PImage [] number = new PImage[10];

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
int [] score_img = new int[16];

int pointBefore = 0;
int pointAfter = 0;

int digit;

//increment brothers
int i = 0;
int j = 0;
int target_locate = 0;
int repeat = 0;
int rate = 0;
int pointcool;
int targetcount = 0;
int miss = 0;

void setup(){
  
  load();
  
  background(255);
  fullScreen(P3D);
  translate(width/2, height/2, 0);
  
  cameraX = 0.0;
  cameraY = 0.0;
  cameraZ = 0.0;
  
  camera(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
}

void draw(){
  
  j += 1;
  rate += 1;
  
  draw_space();  //setup space
  
  if(display == 0)firstset();
  if(display == 1)opening();
  if(display == 2)startDisp();
  if(display == 3)game();
  if(display == 4)result();
  
}

void firstset(){
  background(0);
  camera(0.01, 0, 935, 0, 0, 0, 0, 0, -1);
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
  scale(2);
  if(j>200)display++;
  mv.jump(0);
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
  scale(2);
  translate(0, 300, 0);
  
  translate(0, 300, 0);
  scale(0.5);
  hint(DISABLE_DEPTH_TEST);
  image(pressToStart, -960, -1000);
  hint(ENABLE_DEPTH_TEST);
  scale(2);
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
  if(miss >= 5)display += 1;
}
void result(){
  calc();
  move();
  fill(0);
  translate(100, 0, 50);
  scale(0.1);
  rotateY(radians(-90));
  rotateZ(radians(90));
  hint(DISABLE_DEPTH_TEST);
  //sphere(30);
  image(scoreboard, -960, -540);
  scale(0.3);
  if(score_img[0] >= 1)image(number[score_img[0]], 100, -240);
  /*
  image(number[score_img[1]], 700, -240);
  image(number[score_img[2]], 1000, -240);
  */
  dispScore();
  hint(ENABLE_DEPTH_TEST);
  rotateZ(radians(-90));
  rotateY(radians(90));
  scale(20);
  translate(100, 0, -50);
}
