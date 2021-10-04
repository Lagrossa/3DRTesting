int cols,rows;
int scl = 20;
int w,h;
float[][] terrain;
float flying = 0;
int colorR,colorG,colorB;
int minmax;
boolean paused;
float changeC = 0;
int testVal = 0;
float fontSize = 1;

color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color lgreen = color(0, 132, 0);
void setup(){
  size(600,600,P3D);
  w = 2000;
  h = 1600;
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  minmax = 100;
  strokeWeight(fontSize);
}

void draw(){
  flying-=.1;
  float yoff= flying;
  for(int y = 0; y<rows; y++){
    float xoff = 0;
    for(int x = 0; x<cols; x++){
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -minmax, minmax);
      xoff += 0.2;
      changeC+=.02;
    }
    yoff += 0.2;
  }
  translate(width/2,height/2+50);
  rotateX(PI/3);
  background(0);
  noFill();
  //stroke(132);
  //colorR = floor(map(noise(changeC), 0, 1, 0, 255));;
  //colorG = floor(map(noise(changeC), 0, 1, 150, 255));;
  //print(floor(map(noise(changeC), 0, 1, 0, 255)) + " is the other thing lol");
  colorB = floor(map(noise(changeC), 0, 1, 100, 255));
 /*for(int x = 0; x<1250; x++){
   color colorC = color(x,x,0);
   stroke(red);
   print(x + "   ");
 }
 for(int x = 120; x>0; x--){
   color colorC = color(x,x,0);
   stroke(blue);
   print(x + "   ");
 }        literally does nothing xc                                */
  
  translate(-w/2,-h/2);
  for(int y = 0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x<cols; x++){
    vertex(x*scl, y*scl, terrain[x][y]);
    vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    int myColor = floor(random(1,4));
    /*switch(myColor){
      case 1:
        stroke(red);
        break;
      case 2:
        stroke(lerpColor(red,blue,random(0,1)));
        break;
      case 3:
        stroke(blue);
        break;
    }*/
    }
    endShape();
  }
  
  if(keyPressed){
   if(key=='c'){
     shearX(100);
     shearY(100);
  }
 }
}
void mouseDragged(){
  if(mouseY-pmouseY>0){
    minmax--;
  }
  if(mouseY-pmouseY<0){
    minmax++;
  }
}
