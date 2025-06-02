//note pls fix smooshing ty
import java.util.Arrays;
Board board;
int dropScore = 0;
int clearScore = 0;
int pieceScore = 15;
int ticks = 0;
Piece current;
boolean gameOver = false;

void setup() {
  size(14*35,26*35);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
  dropScore = 0; //reset score
  clearScore = 0;
}

void spawnPiece() {
  Piece newPiece = new Piece(board);
  //for (int i = 0; i < 5; i++) {
  //  if (!board.checkEmpty(newPiece.allpieces.get(i)[0].row, newPiece.allpieces.get(i)[0].col)) {
  //    gameOver = true;
  //    return;
  //  }
  //}
  int crossed = 0;
  for(int i = 2; i < board.getWidth() -2; i++){
    if(!board.checkEmpty(2, i) || !board.checkEmpty(3, i)){
      gameOver = true;
      break;
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
    dropScore += 10;//per piece score bonus
    pieceScore += 5;
    clearScore += score();//line clear bonus
  spawnPiece();}
}

void keyPressed(){
  if(key == 'r' || keyCode == UP){
  current.rotate();
board.render();}else if(key == 's' || keyCode == DOWN){
    if(current.dropOne()) {
      dropScore += 3;
    }
  }else if(key == 'a' || keyCode == LEFT){
    current.moveLeft();
    board.render();
  }else if(key == 'd' || keyCode == RIGHT){
    current.moveRight();
    board.render();
  }else if(key == ' '){
    current.quickDrop();
    dropScore += 20; //drop bonus
    board.render();
  }

  board.render();
}
int score() {
  int finalSc = 0;
  int totalClearr = 0;
  for(int i = 2; i <= 23; i++) {
   boolean rowCleared = true;
   for(int j = 2; j < 12; j++) {
    if(board.board[i][j] == null) {
      rowCleared = false;
      break;
    }
   }
    if(rowCleared) {
      totalClearr++;
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
   return totalClearr*(totalClearr+1)*50; //figure out how to make a tetris?
  }



void endGame() {
 background(30);
 textSize(100);
 fill(50, 168, 82);
 int total = dropScore+clearScore+pieceScore;
text("Score: " + total, 20, 120); 

}

void draw() {
  if(gameOver) {
    background(30);
    endGame();
    int total = dropScore + clearScore+pieceScore;
    System.out.println("Game Over. Score: " + total+ "\n");
    System.out.println("Stats/Subscores:\nDropping score: " + dropScore + "\nNumber of pieces dropped: " + 
    pieceScore/15 + "\nRows Cleared Score: " + clearScore);
    noLoop();
    return;
  }
    
  if(frameCount % 30 == 0){
    tick();
    board.render();


}}
