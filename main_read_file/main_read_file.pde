int x,y;
int side = 8;
float floatSide = side;
color oneColor = color(0,0,0); //black
color zeroColor = color(255,255,255); //white

void setup(){
  background(255);
  noFill();
  size(57,511);
}

void draw(){
 PImage myImage = loadImage("message3.png");
 image(myImage, 0, 0,width,height);
 x = mouseX - 4*side;
 y = mouseY - 4*side;
 rect(x,y,4*side,4*side);
 println(char(getByte()));
}

color getColor(int localX,int localY){
   PImage cursor = get(localX,localY,side,side);  
   int cursorRed = 0;
   int cursorGreen = 0;
   int cursorBlue = 0;
   for(int imageIndex = 0;imageIndex < cursor.width*cursor.height;imageIndex++){
        cursorRed += red(cursor.pixels[imageIndex]);
        cursorGreen += green(cursor.pixels[imageIndex]);
        cursorBlue += blue(cursor.pixels[imageIndex]);
   }
   cursorRed /= cursor.width*cursor.height;
   cursorGreen /= cursor.width*cursor.height;
   cursorBlue /= cursor.width*cursor.height;
   return color(cursorRed,cursorGreen,cursorBlue);
}


void calibrate(){  
   oneColor = getColor(x,y);
   zeroColor = getColor(x + side,y + side);
}

boolean getBit(int bitIndex){
  color bitColor = getColor(x + side*(1 + ((bitIndex +1)%3)),y + side*(1 + floor(float(bitIndex+1)/3)));//add bitIndex stuff here...
  float zeroDist = dist(red(bitColor),green(bitColor),blue(bitColor),red(zeroColor),green(zeroColor),blue(zeroColor));
  float oneDist = dist(red(bitColor),green(bitColor),blue(bitColor),red(oneColor),green(oneColor),blue(oneColor));
  if(oneDist < zeroDist){
    return true;
  }
  else{
    return false;
  }
}

int getByte(){
  int myByte = 0;
  for(int bitIndex = 0;bitIndex < 7;bitIndex++){
    myByte += int(getBit(bitIndex));
    myByte = myByte << 1;
   // print(int(getBit(bitIndex)));
  }
  myByte += int(getBit(7));
 // print(int(getBit(7)));
  return myByte;
}

int[] getBlock(){
  int[] a = {1,2,3};
  return a;
}


void keyPressed(){
 if(key == 'j'){
   floatSide /= 1.05; 
   side = int(floatSide);
 }
 if(key == 'k'){
   floatSide *= 1.05;  
   side = int(floatSide);
 }
 if(key == 'c'){
   calibrate(); 
   print(red(oneColor));
   print(",");
   print(green(oneColor));
   print(",");
   println(blue(oneColor));
   print(red(zeroColor));
   print(",");
   print(green(zeroColor));
   print(",");
   println(blue(zeroColor));
 }
 if(key == 'r'){
   calibrate(); 
   println(char(getByte()));
 }

}