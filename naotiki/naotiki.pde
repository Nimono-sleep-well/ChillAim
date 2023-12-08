PShape rocket;

float ry;
  
public void setup() {
  size(640, 360, P3D);
    
  rocket = loadShape("wewewe.obj");
}

public void draw() {
  background(0);
  lights();
  
  translate(width/2, height/2 + 100, -200);
  rotateZ(PI);
  rotateY(ry);
  shape(rocket);
  
  ry += 0.02;
}
