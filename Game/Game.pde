import java.util.Arrays;
Board board;
Piece current;
void setup() {
  size(140*4,260*4);
  background(255);
   board = new Board();
  current = new Piece(board);
  board.render();
}

void spawnPiece() {

}

void tick() {

}

void keyPressed(){
  if(key == 'r'){
  current.rotate();}else if(key == 'w'){
    current.dropOne();
  }

  board.render();
}

int score() {
  return -1;


}

boolean endGame() {
  return false;


}

void draw() {
}
