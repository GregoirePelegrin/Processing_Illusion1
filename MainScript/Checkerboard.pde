class Checkerboard{
  Checkerboard precedent;
  int col;
  int rows;
  int columns;
  float angle;
  boolean turning;
  
  Checkerboard(int c, int r, int cols, boolean t){
    this.col = c;
    this.rows = r;
    this.columns = cols;
    this.angle = 0;
    this.turning = t;
  }
  
  void setPrecedent(Checkerboard c){
    this.precedent = c;
  }
  
  void update(){
    if(!this.precedent.turning){
      this.turning = true;
    }
    if(this.turning){
      this.angle += 0.01;
    }
    if(this.angle > PI/2){
      this.turning = false;
      this.angle = 0;
    }
  }
  
  void display(){
    fill(this.col);
    for(int i=-1; i<this.rows; i++){
      for(int j=-1; j<this.columns; j++){
        if((i+j)%2 == 0){
          translate(j*sizeCell, i*sizeCell);
          rotate(this.angle);
          rect(0, 0, sizeCell, sizeCell);
          rotate(-this.angle);
          translate(-j*sizeCell, -i*sizeCell);
        }
      }
    }
  }
}
