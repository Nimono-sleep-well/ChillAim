void score(){
  text = "score:" + score;
  textSize(32);
  textAlign(CENTER, CENTER);
  rotateY(radians(-90));
  rotateZ(radians(90));
  text(text, 0, -100, -200); //right, down, temae
  rotateZ(radians(-90));
  rotateY(radians(90));
  fill(#5ff4ac);
}
