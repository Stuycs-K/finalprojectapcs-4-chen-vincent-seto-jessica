import java.util.Arrays;
Board board;
int score = 0;
int ticks = 0;
Piece current;
boolean gameOver = false;
void setup() {
  size(140*4,260*4);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
  score = 0; //reset score
  frameRate(2);
}

void spawnPiece() {
  for(int i = 2; i < board.getWidth() -2; i++){
    if(!board.checkEmpty(5, i)){
      gameOver = true;
    }
  }
current = new Piece(board);

}

void tick() {
  //figure out dropping and insert
  board.render();
  if(gameOver) {
    return;
  }
  if(!current.dropOne()){
    current = null;
  spawnPiece();}

  else {
    current.dropOne();
  }


}

void keyPressed(){
  if(key == 'r' || keyCode == UP){
  current.rotate();}else if(key == 's' || keyCode == DOWN){
    current.dropOne();
  }else if(key == 'a' || keyCode == LEFT){
    current.moveLeft();
  }else if(key == 'd' || keyCode == RIGHT){
    current.moveRight();
  }else if(key == ' ' || keyCode == RIGHT){
    current.quickDrop();
  }

  board.render();
}
int score() {
  int finalSc = 0;
  for(int i = 2; i < 22; i++) {
   boolean rowCleared = true;
   for(int j = 2; j < 12; j++) {
    if(board.board[i][j] == null) {
      rowCleared = false;
      break;
    }
   }
    if(rowCleared) {
      finalSc += 500;
     for(int j = 2; j < 12; j++) {
      board.board[i][j] = null;
     }
      for(int k = i-1; k >=2; k--) {
       board.board[k+1]=board.board[k];//check
     }
     for(int ii = 2; ii < 12; ii++) {
      board.board[2][ii] = null;
     }

    }

   }
   return finalSc; //figure out how to make a tetris?
  }



boolean endGame() {
  /*if() {
   return true;
  } //finish writing pieces and figure out
  */
  return false;


}

void draw() {
    tick();
  if(endGame()) {
    background(30);
    System.out.println("Game Over. Score: " + score);
  }
  else {
    score += score();
  }

if(current == null) {
    spawnPiece();
  
  }
}
