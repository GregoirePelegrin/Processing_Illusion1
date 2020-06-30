int sizeCell;
Checkerboard black;
Checkerboard white;

void setup(){
  size(600, 600);
  frameRate(30);
  rectMode(CENTER);
  
  sizeCell = width/10;
  
  black = new Checkerboard(0, int(height/sizeCell)+1, int(width/sizeCell)+1, true);
  white = new Checkerboard(255, int(height/sizeCell)+1, int(width/sizeCell)+1, false);
  black.setPrecedent(white);
  white.setPrecedent(black);
}

void draw(){
  noStroke();
  
  if(black.turning){
    background(255);
  } else if(white.turning){
    background(0);
  } else {
    background(126);
  }
  
  if(black.turning){
    black.update();
    white.update();
    white.display();
    translate(sizeCell, 0);
    black.display();
  } else if(white.turning) {
    white.update();
    black.update();
    translate(sizeCell, 0);
    black.display();
    translate(-sizeCell, 0);
    white.display();
  } else {
    println("Problem");
  }
}
