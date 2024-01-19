void move(){
  
  if(keyPressed){
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
  target_L = loadShape("naotiki_left.obj");
  target_L.scale(30.0);
  
  target_R = loadShape("naotiki_right.obj");
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
  if(display == 2){
    if(mouseButton == LEFT){
      if(rate >= rpm){//oku,up,left
        rate = 0;
        fire();
      }
    }
  }
}

void keyPressed(){
  if(key == ' ' && display != 2){
    display += 1;
    j=0;
  }
  if(display >= 4)display = 1;
}
