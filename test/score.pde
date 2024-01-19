void score(){
  text_score = "score:" + score;
  fill(#5ff4ac);
  textAlign(CENTER, CENTER);
  rotateY(radians(-90));
  rotateZ(radians(90));
  text(text_score, 0, -50, -200); //right, down, temae
  //text(text_info, 0, -200, -200);
  rotateZ(radians(-90));
  rotateY(radians(90));
}
