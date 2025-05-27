public class Piece{
 //to be implemented later.
 ArrayList<Block[]> allpieces = new ArrayList<>(); //this should be static but the thing doesnt let me make it static
  Board board;
  int centerx;
  int centery;
  int c;
  Block[] shape;
  
 Piece(Board board){
   this(2,3, board);
    
  }
  Piece(int centerx, int centery, Board board){
    this.board = board;
    this.centerx = centerx;
    this.centery = centery;
    this.c = (int) ( 256 * Math.random());
    allpieces.add( new Block[] {new Block(0, 0), new  Block(0, 1)});
    shape = allpieces.get((int) (Math.random() * allpieces.size()));
    
    for(Block part: shape){
      part.setColor(c);
      //board.set(part.getXOffset() + centerx, part.getYOffset() + centery , part);
    }
    
  }

}
