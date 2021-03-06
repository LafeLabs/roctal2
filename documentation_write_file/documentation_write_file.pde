import processing.pdf.*;

int side = 80;

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
//  size(3000,5000, PDF, "thisFile.pdf");
  size(500,800);
  background(255);
  strokeWeight(0.01);
  fill(0);
  for(int localIndex = 0;localIndex < 1024;localIndex++){
    blockArray[localIndex] = 0;
  }
}

void draw() {
  X = 0;
  Y = 0;
  charWrite(X,Y,int('A'));
  side /= 2;
  Y += 9*side;
  charWrite(X,Y,int('B'));
  side /= 2;
  Y += 9*side;
  charWrite(X,Y,int('C'));
  side /= 2;
  Y += 9*side;
  charWrite(X,Y,int('D'));
  side /= 2;
  Y += 9*side;
  charWrite(X,Y,int('E'));
  side /= 2;
  Y += 9*side;
  charWrite(X,Y,int('F'));

  // Exit the program 
  //println("Finished.");
  //exit();
  noLoop();
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