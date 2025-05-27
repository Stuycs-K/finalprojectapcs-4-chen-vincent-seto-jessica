public class Board{
  Block[][] board;
  Piece currentFallingPiece;
  
  Board(){
    board = new Block[14][26];
    //10x20 board, 2 x 2 border, bottom 2 for info
  }
  
  void render() {
    for(int i = 0; i < 2; i++) {
     for(int j = 0; j < 14; j++) {
      board[i][j] = new Block(i,j); //piece needs implementation 
     }
    }
    for(int i = 22; i < 26; i++) {
     for(int j = 0; j < 14; j++) {
      board[i][j] = new Block(i,j); //piece needs implementation 
     }
    }
    //finish later
  
  for(int i = 0; i < 26; i++) {
   for(int j = 0; j < 2; j++) {
     
     board[i][j] = new Block(i,j); //piece needs implementation 
   }
   for(int j = 12; j < 14; j++) {
     board[i][j] = new Block(i,j); //piece needs implementation 
     
   }
    
  }
}
void clearRow(int row) {
    for(int j = row-1; j >= 2; j++) {
    for(int i = 2; i < 12; i++) {
     board[j+1][i] = board[j][i];
    }
    }
    
  }

  
  
}
