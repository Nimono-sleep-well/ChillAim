import processing.opengl.*;
import processing.video.*;

Movie mv;

int i = 0;

String filename;

void setup(){
  background(0);
  fullScreen();
  mv = new Movie(this, "ChillAimLogo.mp4");
  mv.loop();
}

void draw(){
  if(mv.available() == false){
    return;
  }
  mv.read();
  
  background(0);
  scale(0.5);
  image(mv, width/2, 100);
  scale(1);
  i += 1;
}
