//note pls fix smooshing ty
import java.util.Arrays;
Board board;
int dropScore = 0;
int clearScore = 0;
int pieceScore = 15;
int ticks = 0;
Piece current;
boolean gameOver = false;
boolean debug = true;
boolean paused = false;

void setup() {
  //size(14*35,26*35);
  size(1000, 10000);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
  dropScore = 0; //reset score
  clearScore = 0;
  textSize(30);
  text("Next pieces", 510, 40);
}



void tick() {
  //figure out dropping and insert
  if(gameOver) {
    return;
  }
  if(paused){
    score();
  }else{
  if(!current.dropOne()){
    dropScore += 10;//per piece score bonus
    pieceScore += 5;
    clearScore += score();//line clear bonus
    current = board.spawnPiece();
   
  if(current == null){
  gameOver = true;}

}
}}
void renderPiece(Piece toRender, int topX, int topY, int size){
  //Renders it in a 5x5 grid from topX to topY of size size
  for(Block part: toRender.shape){
    fill(part.c);
      square(topX + size * (part.getCOffset() + 2), topY + size * (part.getROffset() +2), size);
  }
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
  }else if(key == 'n' && paused){
    board.spawnPiece();}
    else if(key == 'o' && debug){
    print(current);
    }else if(key == 'p'){
      paused = !paused;
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
    renderPiece(current, 510, 60, 35);


}}
