public class Piece{
 //to be implemented later.
  ArrayList<Block[]> allpieces = new ArrayList<>(); //this should be static but the thing doesnt let me make it static
  Board board;
  int centerR;
  int centerC;
  int c;
  Block[] shape;

 Piece(Board board){
   this(5,6, board);

  }

  Piece(int centerR , int centerC, Board board){

    this.board = board;
    this.centerC = centerC;
    this.centerR = centerR;
    this.c = color((int) ( 256 * Math.random()),(int) ( 256 * Math.random()),(int) ( 256 * Math.random())) ;
    //O
    allpieces.add(new Block[] {new Block(0, 2), new  Block(0, 1), new Block(0, 0), new  Block(0, -1),new  Block(1, -1)});
     allpieces.add(new Block[] {new Block(-1, 1), new  Block(1, 1), new Block(0, 1), new  Block(0, -1),new  Block(0, 0)});
 
    
   //P
  allpieces.add(new Block[] {new Block(0,1),new Block(1,1),new Block(0,0),new Block(1,0),new Block(0,-1)});
  
  //Q
  allpieces.add(new Block[] {new Block(0, 2), new  Block(0, 1), new Block(0, 0), new  Block(0, -1),new  Block(1, -1)});
  
  //R
  
  allpieces.add(new Block[] {new Block(0,1),new Block(1,1),new Block(0,0),new Block(-1,0),new Block(0,-1)});
  
  //S
  allpieces.add(new Block[] {new Block(-2,0),new Block(-1,0),new Block(0,0),new Block(0,1),new Block(1,1)});
  //T
  allpieces.add(new Block[] {new Block(-1, 1), new  Block(1, 1), new Block(0, 1), new  Block(0, -1),new  Block(0, 0)});
  //U  
  allpieces.add(new Block[] {new Block(0,1),new Block(1,1),new Block(0,0),new Block(0,-1),new Block(1,-1)});
  //V
  allpieces.add(new Block[] {new Block(0,2),new Block(0,1),new Block(0,0),new Block(1,0),new Block(2,0)});
  //W
  allpieces.add(new Block[] {new Block(-1,1),new Block(-1,0),new Block(0,0),new Block(0,-1),new Block(1,-1)});
  //X
  allpieces.add(new Block[] {new Block(0,1),new Block(-1,0),new Block(0,0),new Block(0,-1),new Block(1,0)});
  //Y
  allpieces.add(new Block[] {new Block(-2,0),new Block(-1,0),new Block(0,0),new Block(0,1),new Block(1,0)});
  //Z
  allpieces.add(new Block[] {new Block(-1,1),new Block(0,1),new Block(0,0),new Block(0,-1),new Block(1,-1)});
     
  
    
    //shape = allpieces.get((int) (Math.random() * allpieces.size()));
    shape = allpieces.get(allpieces.size() - 1);
    for(Block part: shape){
      part.setColor(c);
     board.set(part.getROffset() + centerR, part.getCOffset() + centerC, part);
    }

  }
 

  void removePieceFromBoard(Board board){
     for(Block part: shape){

       board.set(part.getROffset() + centerR, part.getCOffset() + centerC, null);
     }
  }

  void addPieceToBoard(Board board){
     for(Block part: shape){
      board.set(part.getROffset() + centerR, part.getCOffset() + centerC,  part);
    }}

  void dropOne(){
    if(canFit(board, centerR + 1, centerC)){
      removePieceFromBoard(board);
    centerR++;
     addPieceToBoard(board);
    }
  }

  boolean rotate(){
   Block[] newRotation = new Block[shape.length];
   int i = 0;
  for(Block part: shape){
    newRotation[i] = new Block(part.getROffset(), - 1 * part.getCOffset(), c); //becomes (y, -x) (-1, 2) should map to (2, 1)
    i++;
  }
  if(canFit(board, centerR, centerC, newRotation)){
    removePieceFromBoard(board);
    shape = newRotation;
    addPieceToBoard(board);
      return true;
    }else{
  return false;}
  }
  
  
  boolean canFit(Board board, int newr, int newc){return canFit(board, newr, newc, shape);}

  boolean canFit(Board board, int newr, int newc, Block[] pieceShape){
     for(Block part: pieceShape){
      if(!board.checkEmpty(part.getROffset() + newr, part.getCOffset() + newc)){
        return false;}
    }
return true;
  }

}
