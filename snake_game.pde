boolean[] keysPressed = new boolean[255];
Direction playerDirection;
Snake snake;
boolean dead = false;
int foodX, foodY;
int scale = 15;

void setup(){
  size(600, 375);
  background(0);
  fill(255);
  noStroke();
  
  playerDirection = Direction.EAST;
  snake = new Snake(4, 1, 5);
  snake.show();
  newFood();
}

void newFood(){
  foodX = (int) random(0, width/scale);
  foodY = (int) random(0, height/scale);
}

void draw(){
  if(dead){
    delay(500);
    System.exit(0);
  }
  background(0);
  snake.show();
  
  fill(0, 255, 0);
  rect(foodX*scale, foodY*scale, scale, scale);
  fill(255);
}

void die(){
  background(0);
  fill(255, 0, 0);
  snake.show();
  dead = true;
}

void keyPressed(){
  if(key == 'w'){
    playerDirection = Direction.NORTH;
    snake.move(playerDirection);
    
  }else if(key == 'a'){
    playerDirection = Direction.WEST;
    snake.move(playerDirection);
    
  }else if(key == 's'){
    playerDirection = Direction.SOUTH;
    snake.move(playerDirection);
    
  }else if(key == 'd'){
    playerDirection = Direction.EAST;
    snake.move(playerDirection);
    
  }else{
    snake.move(playerDirection);
  }

  if(key < keysPressed.length){
    keysPressed[key] = true;
  }
  
}

void keyReleased(){
  if(key < keysPressed.length){
    keysPressed[key] = false;
  }
}
