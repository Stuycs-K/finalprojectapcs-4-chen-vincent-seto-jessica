import java.util.Arrays;
Board board;
int score = 0;
int ticks = 0;
Piece current;
boolean gameOver = false;

void setup() {
  size(14*35,26*35);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
  score = 0; //reset score
}

void spawnPiece() {
  Piece newPiece = new Piece(board);
  //for (int i = 0; i < 5; i++) {
  //  if (!board.checkEmpty(newPiece.allpieces.get(i)[0].row, newPiece.allpieces.get(i)[0].col)) {
  //    gameOver = true;
  //    return;
  //  }
  //}
  for(int i = 2; i < board.getWidth() -2; i++){
    if(!board.checkEmpty(2, i)){
      gameOver = true;
    }
  }
  current = newPiece;

}

void tick() {
  //figure out dropping and insert
  if(gameOver) {
    return;
  }
  if(!current.dropOne()){
    current = null;
    score += score();
  spawnPiece();}

  else {
    current.dropOne();
  }


}

void keyPressed(){
  if(key == 'r' || keyCode == UP){
  current.rotate();
board.render();}else if(key == 's' || keyCode == DOWN){
    current.dropOne();
  }else if(key == 'a' || keyCode == LEFT){
    current.moveLeft();
    board.render();
  }else if(key == 'd' || keyCode == RIGHT){
    current.moveRight();
    board.render();
  }else if(key == ' ' || keyCode == RIGHT){
    current.quickDrop();
    board.render();
  }

  board.render();
}
int score() {
  int finalSc = 0;
  for(int i = 2; i <= 23; i++) {
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



void endGame() {
 background(30);
 textSize(128);
 fill(50, 168, 82);
text("Score: " + score, 40, 120); 

}

void draw() {
  if(frameCount % 30 == 0){
    board.render();

  if(endGame()) {
    background(30);
    System.out.println("Game Over. Score: " + score);
  }

}}
