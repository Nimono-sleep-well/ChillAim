void fire(){
  bX = speed * rate;
  pushMatrix();
  rotateX(PI/2);
  translate(bX, bY, bZ);
  //shape(bullet);
  sphere(10);
  popMatrix();
  
  if((bX >= -targetZ - 100 && bX <= -targetZ + 100) && (bY >= targetY - 100 && bX <= targetY + 100) && (bZ >= targetX - 100 && bZ <= targetX + 100)){
    score += 10;
  }
}
void reload(){
  //todo
}
