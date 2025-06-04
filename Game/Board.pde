import java.util.*;

public class Board{
  int bwidth = 14;
  int bheight = 26;
  Block[][] board;
  Piece currentFallingPiece;
  ArrayList<Piece> nextPieces = new ArrayList<Piece>(); 
  
  Board(){
    board = new Block[bheight][bwidth];
 
    for(int i = 0; i < 3; i++){
      nextPieces.add(new Piece(this));}

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
        if(j >= 2 && j <bwidth - 2 && i >= 2 && i < bheight - 2){
        stroke(color(255, 255, 0));
        }else{noStroke();}
       if(board[i][j] != null) {
          //if(board[i][j].getType().equals("falling")){
          //noStroke();}                   
            fill(board[i][j].getColor());
       }else{
         fill(color(0));

       }
         square(35*j,35*i,35);
    }}}
    
  void set(int r, int c, Block toSet){board[r][c] = toSet;}
  int getWidth(){return bwidth;}
  int getHeight(){return bheight;}//includes walls
  ArrayList<Piece> getNextPieces(){return nextPieces;}
Piece spawnPiece() {
  nextPieces.add(new Piece(this));
  for(int i = 2; i < getWidth() -2; i++){
    if(!checkEmpty(5, i)){
      return null;
    }
  }
  Piece newPiece = nextPieces.remove(0);
  newPiece.addPieceToBoard(this);
  return newPiece;
}


boolean checkEmpty(int r, int c){

  return (board[r][c] == null || board[r][c].getType().equals( "falling"));  //dont want falling pieces to stop themselves from falling
}
void dropDown(int row) {
  //Call on the row that was deleted.
    for(int j = row; j >= 5; j--) {
    for(int i = 2; i < 12; i++) {
      if(board[j-1][i] == null || board[j-1][i].getType().equals("fallen")){
     board[j][i] = board[j-1][i];
    }}
    }

  }

 }
