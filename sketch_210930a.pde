float a;
float b;
int c;
void setup(){
  size(400,400, P3D);
  b=.5;
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2,height/2);
  rotateX(a);
  rotateY(a);
  scale(b);
  for(int x = 200; x>=0; x-=50){
   sphere(x); 
  }
  sphereDetail(c);
  a+=.01;
  
  if(keyPressed){
   if(key == 'x'){
     c++;
   }
   if(key == 'z'){
     c--;
   }
  }
}

void mouseDragged(){
  if(mouseY-pmouseY > 0){
   b+=.01;
   print(b);
  }
  if(mouseY-pmouseY < 0){
   b-=.01;
  }
}
