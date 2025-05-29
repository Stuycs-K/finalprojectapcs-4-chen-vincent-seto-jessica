void setup() {
  size(140*4,260*4);
  background(255);
  Board board = new Board();
  Piece test = new Piece(board);
  test.rotate();
  board.render();

}

void spawnPiece() {

}

void tick() {

}

int score() {
  return -1;


}

boolean endGame() {
  return false;


}
