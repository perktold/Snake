class Snake{
  int snakeLength;
  ArrayList<SnakePart> parts;
  ArrayList<Direction> directions;
  
  Snake(int x, int y, int snakeLength){
    this.snakeLength = snakeLength;
    parts = new ArrayList<SnakePart>(snakeLength);
    directions = new ArrayList<Direction>(snakeLength);
    
    for(int i = 0; i < snakeLength; i++){
      parts.add(new SnakePart(x-i, y)); //snake is facing right
      directions.add(Direction.EAST);
    }
  }
  void addPart(){
    snakeLength++;
    int newPartX = parts.get(parts.size()-1).getX();
    int newPartY = parts.get(parts.size()-1).getY();
    Direction lastDirection = directions.get(directions.size()-1);
    
    if(lastDirection.equals(Direction.NORTH))
      newPartY++;
    if(lastDirection.equals(Direction.EAST))
      newPartX--;
    if(lastDirection.equals(Direction.SOUTH))
      newPartY--;
    if(lastDirection.equals(Direction.WEST))
      newPartX++;
    
    parts.add(new SnakePart(newPartX, newPartY));
    directions.add(directions.get(directions.size()-1));
  }
  void move(Direction newDirection){
    for(int i = directions.size()-1; i >= 1; i--){
      directions.set(i, directions.get(i-1));
    }
    directions.set(0, newDirection);
    
    for(int i = 0; i < snakeLength; i++){
      if(directions.get(i).equals(Direction.NORTH))
        parts.get(i).up();
        if(parts.get(0).getY() < 0) die();
      if(directions.get(i).equals(Direction.EAST))
        parts.get(i).right();
        if(parts.get(0).getX()*scale >= width) die();
      if(directions.get(i).equals(Direction.SOUTH))
        parts.get(i).down();
        if(parts.get(0).getY()*scale >= height) die();
      if(directions.get(i).equals(Direction.WEST))
        parts.get(i).left();
        if(parts.get(0).getX() < 0) die();
    }
    
    
    for(int i = 1; i < parts.size(); i++){
      if(parts.get(0).getX() == parts.get(i).getX() && parts.get(0).getY() == parts.get(i).getY()){
        die();
      }
    } 
    
    if(parts.get(0).getX() == foodX && parts.get(0).getY() == foodY){
      addPart();
      newFood();
    }
  }
  
  void show(){
    for(SnakePart p : parts){
      rect(p.getX()*scale, p.getY()*scale, scale, scale);
      //println("x: " + p.x + ", y: " + p.y);
    }
  }
}
