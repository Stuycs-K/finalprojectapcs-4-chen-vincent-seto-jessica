//note pls fix smooshing ty
import java.util.Arrays;
Board board;

Piece current;
Piece swapOut;
boolean gameOver = false;
boolean debug = true;

//scoring
int dropScore = 0;
int clearScore = 0;
int pieceScore = 15;
int totalScore = dropScore + clearScore + pieceScore;

//powerups
boolean frozen = false;
int frozenTimer = 0;
int scoreMultiplier = 1;
int scoreMultTimer = 0;

void setup() {
  size(1000, 10000);
  background(200);
   board = new Board();
  current = new Piece(board);
  board.render();
  dropScore = 0; //reset score
  clearScore = 0;
  textSize(30);
}

void tick() {
  if(current.turnFallen()){
    dropScore += 10 * scoreMultiplier;//per piece score bonus
    clearScore += score();//line clear bonus
    current = board.spawnPiece();
  }
  if(current == null){
  gameOver = true;
    return;}
  if(!frozen){
    current.dropOne();
  }
    pieceScore += 5 * scoreMultiplier;
}

void renderPiece(Piece toRender, int topX, int topY, int size){
  //Renders it in a 7x7 grid from topX to topY of size size
       stroke(0);
     fill(0);
     square(topX, topY, size * 7);
      noStroke();
for(Block part : toRender.shape){
    fill(part.c);
      square(topX + size * (part.getCOffset() + 3), topY + size * (part.getROffset() +3), size);
      if(part.getImage()!= null){
      image(part.getImage(), topX + size * (part.getCOffset() + 3), topY + size * (part.getROffset() +3), size, size);}

  }
}
void renderNextPieces(){    
    fill(200);
    square(510, 60, 5000);
    for(int i =0; i < board.nextPieces.size(); i++){
    int size = 20;
    renderPiece(board.nextPieces.get(i), 510, 60 + (size * 7 + 10) * i, size);}}

void keyPressed(){
  if(key == 'r' || key == 'w' || keyCode == UP){
  current.rotate();
board.render();}else if(key == 's' || keyCode == DOWN){
    if(current.dropOne()) {
      dropScore += 3 * scoreMultiplier;
    }
  }else if(key == 'a' || keyCode == LEFT){
    current.moveLeft();
    board.render();
  }else if(key == 'd' || keyCode == RIGHT){
    current.moveRight();
    board.render();
  }else if(key == ' '){
    current.quickDrop();
    dropScore += 20 * scoreMultiplier; //drop bonus
    board.render();
  }else if(key == 'n' && debug){
    board.spawnPiece();}
    else if(key == 'o' && debug){
    print(current);
    }else if(key == 'p' && debug){
      frozen = !frozen;
    }else if(key =='q'){
    if(swapOut == null && board.nextPieces.get(0).canFit(board, current.getR(), current.getC())){
        swapOut = current;
        current.removePieceFromBoard(board);
        int newR = current.getR();
        int newC = current.getC();
        current = board.spawnPiece(); 
        current.teleport(newR, newC);
    }else if(swapOut.canFit(board, current.getR(), current.getC())){
          current.removePieceFromBoard(board);
          int newR = current.getR();
          int newC = current.getC();
          Piece temp = swapOut;
          swapOut = current;
          current = temp;
          current.teleport(newR, newC);
        }

      }
    
  board.render();
}
void mouseClicked(){
  if(debug){print(board.board[(int) mouseY/35][(int) mouseX/35]);}}

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
       if(board.board[i][j].getPower().equals("freeze")){
         frozen = true;
         frozenTimer = frameCount;  
     }else if(board.board[i][j].getPower().equals("score")){
          print("scoreboosting");
       scoreMultiplier = 3;
       scoreMultTimer = frameCount;  
   }
      board.board[i][j] = null;
     }
     board.dropDown(i);
    }
   }
   return totalClearr*(totalClearr+1)*50; //figure out how to make a tetris?
  }



void endGame() {
 background(30);
 textSize(100);
 fill(50, 168, 82);
text("Score: " + totalScore, 20, 120); 

}

void removePowerUps(){
  if(frozen && frameCount - frozenTimer > 60 * 3){
    frozen = false;}
  if(scoreMultiplier > 1 && frameCount - scoreMultTimer > 60 * 5){
    scoreMultiplier = 1;
  }
}

void draw() {
  if(gameOver) {
    background(30);
    endGame();
    System.out.println("Game Over. Score: " + totalScore+ "\n");
    System.out.println("Stats/Subscores:\nDropping score: " + dropScore + "\nNumber of pieces dropped: " + 
    pieceScore/15 + "\nRows Cleared Score: " + clearScore);
    noLoop();
    return;
  }
 
  if(frameCount % 30 == 0){
    tick();
    board.render();
    removePowerUps();
    renderNextPieces();
    textSize(50);
     fill(66, 135, 200);
     totalScore = dropScore + clearScore + pieceScore;
    text("Score: " + totalScore, 695, 120);
      textSize(30);
    if(frozen){
      text("Frozen for " + (60. * 3 - (frameCount - frozenTimer))/60 + " seconds", 695, 200);
    }
    if(scoreMultiplier > 1){
        text("3x score for " + (60. * 5 - (frameCount - scoreMultTimer))/60 + " seconds", 695, 240);
    }
    fill(200,0,0);
     }
}
