public class Piece{
 //to be implemented later.
  ArrayList<Block[]> allpieces = new ArrayList<>(); //this should be static but the thing doesnt let me make it static
  Board board;
  int centerR;
  int centerC;
  int c;
  Block[] shape;

 Piece(Board board){
   this(3,4, board);

  }
  
  Piece(int centerR , int centerC, Board board){
    this.board = board;
    this.centerC = centerC;
    this.centerR = centerR;
    this.c = (int) ( 256 * Math.random());
    allpieces.add( new Block[] {new Block(0, 0), new  Block(0, 1)});
    shape = allpieces.get((int) (Math.random() * allpieces.size()));

    for(Block part: shape){
      part.setColor(c);
     board.set(part.getROffset() + centerR, part.getCOffset() + centerC, part);
    }

  }
  void dropOne(){
    if(canFit(board, centerR + 1, centerC)){
          for(Block part: shape){
      part.setColor(c);
      board.set(part.getROffset() + centerR, part.getCOffset() + centerC, null);
    }
    centerR++;
   for(Block part: shape){
      part.setColor(c);
      board.set(part.getROffset() + centerR, part.getCOffset() + centerC,  part);
    }
    }
  }
    
  boolean canFit(Board board, int newr, int newc){return canFit(board, newr, newc, shape);}

  boolean canFit(Board board, int newr, int newc, Block[] pieceShape){
     for(Block part: pieceShape){
      part.setColor(c);
      if(!board.checkEmpty(part.getROffset() + newr, part.getCOffset() + newc)){
        return false;}
    }
return true;
  }

}
