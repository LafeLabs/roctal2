int side = 20;

int bitIndex = 0;
int X,Y;
int numberofColumns = 5;
int numberofRows = 5;
int blockLength = numberofRows*numberofColumns;
int columnIndex,rowIndex;
int blockPositionX = 0;
int blockPositionY = 0;
int globalIndex = 0;
int xBlocks = 4;
int yBlocks = 7;
int blockIndex = 0;
String message = "TOO MANY SECRETS";
int[] blockArray = new int[blockLength];

void setup() {
  size(800,800);
  background(255);
  strokeWeight(0.01);
  fill(0);
  for(int localIndex = 0;localIndex < message.length();localIndex++){
    blockArray[localIndex] = int(message.charAt(localIndex));
  }
}

void draw() {
 blockWrite(); 
 noLoop();
}

void blockWrite(){
  rect(blockPositionX,blockPositionY,4*side,12*side);
  rect(blockPositionX,blockPositionY,12*side,4*side);
  rect(blockPositionX + side*(12 + 4*numberofColumns),blockPositionY + side*(12 + 4*numberofRows),4*side,4*side);
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