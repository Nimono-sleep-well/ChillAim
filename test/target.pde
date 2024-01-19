void firing(){
  target_locate += 1;
  if(target_locate*10-1000 >= 1100 || -target_locate*10+1000 <= -1100 || target_locate == 0){
    repeat = (int)random(2);
    high = (int)random(100);
    target_locate = 0;
    targetcount += 1;
  }
  if(repeat == 0){
    
    targetX = -target_locate*10+1000;
    targetY = high - 50;
    targetZ = -200;
    
    pushMatrix();
    rotateX(PI/2);
    rotateY(-PI/2);
    translate(targetX, targetY, targetZ); //LEFT, UP, FRONT
    sphere(40);
    //shape(target_L);
    popMatrix();
  }else{
    
    targetX = target_locate*10-1000;
    targetY = high;
    targetZ = -200;
    
    pushMatrix();
    rotateX(PI/2);
    rotateY(-PI/2);
    translate(targetX, targetY, targetZ); //LEFT, UP, FRONT
    sphere(40);
    //shape(target_R);
    popMatrix();
  }
}
