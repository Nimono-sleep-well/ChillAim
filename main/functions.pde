void move(){
  if(keyPressed){
    if(key == 'w' || key == 'W')cameraX++;
    if(key == 'a' || key == 'A')cameraY--;
    if(key == 's' || key == 'S')cameraX--;
    if(key == 'd' || key == 'D')cameraY++;
    if(key == 'r' || key == 'R')rate = 0;
  }
  
  angleXZ = asin((mouseY - height/2)/(float)height);
  angleY = acos((mouseX - width/2)/(float)height/2);
  
  cameraAngX = cameraX + ((float)height * cos(angleXZ));
  cameraAngY = cameraY + ((float)width * cos(angleY));
  cameraAngZ = cameraZ + (-(float)height * sin(angleXZ * 2));
  
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
  translate(cameraAngX, cameraAngY, cameraAngZ);
  sphere(5);
  translate(-cameraAngX, -cameraAngY, -cameraAngZ);
  fill(0);
  text("Hello World!", 100, 100);
}

void load(){
  target_L = loadShape("flying_naotiki.obj");
  target_L.scale(30.0);
  
  target_R = loadShape("flying_naotiki_right.obj");
  target_R.scale(30.0);
  
  mv = new Movie(this, "ChillAimLogo.mp4");
  mv.loop();
  
  opening = new Movie(this, "ChillAimOpening.mp4");
  opening.play();
  
  scoreboard = loadImage("score.png");
  
  for(i=0;i<10;i++){
    number[i] = loadImage("number/" + i + ".png");
  }
  
  pressToStart = loadImage("PressToStart.png");
}

void mousePressed(){
  if(mouseButton == LEFT){
    if(rate >= rpm){//oku, up, left
      rate = 0;
      fire();
    }
  }
}

void keyPressed(){
  if(key == ' ' && display != 3 && display != 4){
    display += 1;
    j=0;
  }
  //if(display == 4)display = 3;
  if(display == 1)opening.jump(0);
}

void calc(){
  score_img[0] = score/100;
  score_img[1] = (score%100 - score%10) / 10;
  score_img[2] = score%10;
}

void dispScore(){
  int divide = 10;
  for(i = 10;score/i != 0;i*=10){
    digit = i;
    println("digit!");
  }
  for(i = 0;i < digit;i++){
    for(int k = 0;k < i;k++){
      divide *= 10;
    }
    println("divide!");
    score_img[i] = ((score % divide) - (score % (divide/10)))/(divide/10);
    image(number[score_img[i]], 1000 - i*300, -240);
  }
}
