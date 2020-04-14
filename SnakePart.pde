class SnakePart{
  private int x, y;
  public SnakePart(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  void up(){
    y--;
  }
  
  void left(){
    x--;
  }
  void down(){
    y++;
  }
  
  void right(){
    x++;
  }
}
