import java.util.Arrays;
Board board;
int score = 0;
int ticks = 0;
Piece current;
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
current = new Piece(board);
}

void tick() {
  //figure out dropping and insert
  board.render();
  if(!current.dropOne()){
    current = null;
  spawnPiece();}
  if(endGame()) {
    return;
  }
  else {
    current.dropOne();
  }


}

void keyPressed(){
  if(key == 'r' || keyCode == UP){
  current.rotate();}else if(key == 'd' || keyCode == DOWN){
    current.dropOne();
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
