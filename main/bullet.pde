void fire(){
  
  cursorX = 200;
  float ratio = cursorX / cameraAngX;
  cursorY = cameraAngY * ratio;
  cursorZ = cameraAngZ * ratio;
  
  translate(cursorX, cursorY, cursorZ);//BACK, RIGHT, UP
  sphere(10);
  translate(-cursorX, -cursorY, -cursorZ);
  
  if(cursorY >= -targetX - 50 && cursorY <= -targetX + 50 && cursorZ >= targetY -50 && cursorZ <= targetY +50){
    score += 10;
  }
}
