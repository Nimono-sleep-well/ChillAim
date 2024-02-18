void score(){
  translate(150, 0, 50);
  rotateY(radians(-90));
  rotateZ(radians(90));
  scale(0.05);
  hint(DISABLE_DEPTH_TEST);
  image(scoreboard, -960, -540);
  hint(ENABLE_DEPTH_TEST);
  scale(20);
  rotateZ(radians(-90));
  rotateY(radians(90));
  translate(-150, 0, -50);
}
