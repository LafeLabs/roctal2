import processing.pdf.*;

int side = 5;

int bitIndex = 0;
int X,Y;
int numberofColumns = 32;
int numberofRows = 32;
int columnIndex,rowIndex;
int blockPositionX = 0;
int blockPositionY = 0;
int globalIndex = 0;
int[] blockArray = new int[1024];
int blockSpacing = 140*side;
int xBlocks = 4;
int yBlocks = 7;
int blockIndex = 0;

void setup() {
  size(3000,5000, PDF, "thisFile.pdf");
  background(255);
  strokeWeight(0.01);
  fill(0);
  for(int localIndex = 0;localIndex < 1024;localIndex++){
    blockArray[localIndex] = 0;
  }
}

void draw() {
  byte b[] = loadBytes("description2.txt");  //description
  byte USC[] = loadBytes("USC.txt");

 for(int localIndex = 0;localIndex < b.length && localIndex < 1024;localIndex++){
    blockArray[localIndex] = b[localIndex];
 }
 blockWrite();

 for(blockIndex = 1;blockIndex < 26;blockIndex++){
   for(int localIndex = 0;localIndex < USC.length && localIndex < 1024;localIndex++){
      blockArray[localIndex] = USC[localIndex + 1024*blockIndex];
   }
   blockPositionX = blockSpacing*(blockIndex%4);
   blockPositionY = blockSpacing*(blockIndex/4);
   
   blockWrite();
 
 }
 
 blockPositionX += blockSpacing;
 
 int lastBlockLength  = USC.length - 1024*26;
 println(lastBlockLength);
 
 for(int localIndex = 0;localIndex < 1024;localIndex++){
    blockArray[localIndex] = 0;
 }

 
for(int localIndex = 0;localIndex < lastBlockLength;localIndex++){
    blockArray[localIndex] = USC[localIndex + 1024*26];
 }
 blockWrite();

 
  // Exit the program 
  println("Finished.");
  exit();
}

void blockWrite(){
  rect(blockPositionX,blockPositionY,4*side,12*side);
  rect(blockPositionX,blockPositionY,12*side,4*side);
  rect(blockPositionX + blockSpacing,blockPositionY + blockSpacing,4*side,4*side);
  globalIndex = 0;
  for(rowIndex = 0;rowIndex < numberofRows;rowIndex++){
   for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
     charWrite(blockPositionX + 8*side + 4*side*columnIndex,blockPositionY + 8*side + rowIndex*4*side,blockArray[globalIndex]);
     globalIndex++;
   }
 }
}

void charWrite(int localX, int localY,int localInt){//stripped down version
  fill(0);
  rect(localX, localY,side,side);//alignment and calibration bit
  rect(localX, localY + side,side/4,3*side);
  rect(localX+side/2, localY + side,side/4,3*side);
  rect(localX + side,localY,3*side,side/4);

  bitIndex = 8;
  for(int indexY = 1;indexY < 4;indexY++){
    for(int indexX = 1;indexX < 4;indexX++){
      if((localInt & int(pow(float(2),float(bitIndex)))) >> bitIndex == 1){
        rect(localX + indexX*side,localY + indexY*side,side,side);          
      }      
      bitIndex--;
    }
  } 
}