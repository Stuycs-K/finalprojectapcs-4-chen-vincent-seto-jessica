public class Board{
  int bwidth = 14;
  int bheight = 26;
  Block[][] board;
  Piece currentFallingPiece;
  void set(int r, int c, Block toSet){
    board[r][c] = toSet;
  }

  int getWidth(){return bwidth;}
  int getHeight(){return bheight;}//includes walls

  Board(){
    board = new Block[bheight][bwidth];
    //10x20 board, 2 x 2 border, bottom 2 for info

    for(int i = 0; i < 2; i++) {
     for(int j = 0; j < bwidth; j++) {
      board[i][j] = new Block("wall");
    }
    }

    for(int i = bheight - 2; i < bheight; i++) {
     for(int j = 0; j < bwidth; j++) {
      board[i][j] = new Block("wall");
     }
    }
    //finish later

  for(int i = 0; i < bheight; i++) {
    for(int j = 0; j < 2; j++) {
      board[i][j] = new Block("wall");
  }


  }
  for(int i = 0; i < bheight; i++) {

    for(int j = 12; j < bwidth; j++) {
      board[i][j] = new Block("wall");
  }
  }
    }


  void render(){
    for(int i = 0; i < board.length; i++) {

     for(int j = 0; j < board[0].length; j++) {

       if(board[i][j] != null) {
       fill(board[i][j].getColor());

       }else{
         fill(color(255));}
       square(35*j,35*i,35);

       }

    }
}

boolean checkEmpty(int r, int c){

//  if(!(board[r][c] == null || board[r][c].getType().equals( "falling"))){
//     print(board[r][c]);
//  }
  return (board[r][c] == null || board[r][c].getType().equals( "falling"));  //dont want falling pieces to stop themselves from falling
}
void clearRow(int row) {
    for(int j = row-1; j >= 2; j++) {
    for(int i = 2; i < 12; i++) {
     board[j+1][i] = board[j][i];
    }
    }

  }

 }
