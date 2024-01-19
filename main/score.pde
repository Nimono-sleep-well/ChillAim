void score(){
  text_score = "score:" + score;
  fill(#5ff4ac);
  textSize(32);
  textAlign(CENTER, CENTER);
  rotateY(radians(-90));
  rotateZ(radians(90));
  text(text_score, 0, -50, -200); //right, down, temae
  rotateZ(radians(-90));
  rotateY(radians(90));
  
  translate(0, -50, -200);
  rotateY(radians(-90));
  rotateZ(radians(90));
  scale(1);
  hint(DISABLE_DEPTH_TEST);
  image(scoreboard, -960, -540);
  hint(ENABLE_DEPTH_TEST);
  scale(1);
  rotateZ(radians(-90));
  rotateY(radians(90));
  translate(0, 50, 200);
}
