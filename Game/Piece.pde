public class Piece{
 //to be implemented later.
  ArrayList<Block[]> allpieces = new ArrayList<>(); //this should be static but the thing doesnt let me make it static
  Board board;
  int centerR;
  int centerC;
  int c;
  Block[] shape;

 Piece(Board board){
   this(2,4, board);

  }
  
  Piece(int centerC, int centerR, Board board){
    this.board = board;
    this.centerC = centerC;
    this.centerR = centerR;
    this.c = (int) ( 256 * Math.random());
    allpieces.add( new Block[] {new Block(0, 0), new  Block(0, 1)});
    shape = allpieces.get((int) (Math.random() * allpieces.size()));

    for(Block part: shape){
      part.setColor(c);
      board.set(part.getCOffset() + centerC, part.getROffset() + centerR , part);
    }

  }
  
  boolean canFit(Board board, int newx, int newy){
     for(Block part: shape){
      part.setColor(c);
      if(!board.checkEmpty(part.getROffset() + newx, part.getCOffset() + newy)){
        return false;}
    }
return true;
  }

}
