import processing.pdf.*;

int x = 0;
int side = 10;

void setup(){
textSize(10); 
size(400,600, PDF, "ASCIItable.pdf");  
background(255);
}

void draw(){
  int sixtyfours = 0;
  for(int eights = 4;eights < 8; eights++){
     for(int ones = 0;ones < 8;ones++){
        print(char(ones + 8*eights + 64*sixtyfours));
        charWrite(4*side + 4*side*ones,4*side+4*side*(eights-4),ones + 8*eights + 64*sixtyfours);
     }
     println();
  }
  
  sixtyfours++;
println();
  for(int eights = 0;eights < 8; eights++){
     for(int ones = 0;ones < 8;ones++){
        print(char(ones + 8*eights + 64*sixtyfours));
        charWrite(4*side + 4*side*ones,4*side*eights + side*4*6,ones + 8*eights + 64*sixtyfours);

     }
     println();
  }

  textSize(16);
  for(int eights = 0 ;eights < 8; eights++){
     text(eights,float(5*side + 4*side*eights),side*3); 
  }
  for(int ones = 4 ;ones < 8; ones++){
     text(ones,float(side*2),float(7*side + 4*side*(ones-4))); 
  }

  noLoop();
  exit();
}

void charWrite(int localX, int localY,int localInt){//stripped down version
  fill(0);
  rect(localX, localY,side,side);//alignment and calibration bit
  rect(localX, localY + side,side/4,3*side);
  rect(localX+side/2, localY + side,side/4,3*side);
  rect(localX + side,localY,3*side,side/4);
  if(localInt == 0040){
   text("SPACE",float(localX + side),float(localY+side));
  }
  else{
    text(char(localInt),float(localX+side),float(localY + side));
  }
  int bitIndex = 8;
  for(int indexY = 1;indexY < 4;indexY++){
    for(int indexX = 1;indexX < 4;indexX++){
      if((localInt & int(pow(float(2),float(bitIndex)))) >> bitIndex == 1){
        rect(localX + indexX*side,localY + indexY*side,side,side);          
      }      
      bitIndex--;
    }
  } 
}