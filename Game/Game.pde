 
import java.util.Arrays;
Board board;
int score = 0;
Piece current;
void setup() {
  size(140*4,260*4);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
  score = 0; //reset score
  //Block test = new Block( color(50), "a", new Piece());

}

void spawnPiece() {

}

void tick() {

  score += score();
}

void mouseClicked(){
  //current.rotate();
  current.dropOne();
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

  return false;


}

void draw() {
}
