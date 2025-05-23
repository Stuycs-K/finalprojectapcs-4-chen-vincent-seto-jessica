public class Block{
 
  color c;
  String type;
  Piece piece;
  
  Block(color c, String type, Piece piece){
    this.c = c; 
    setType(type);
    this.piece = piece;
  }
  
  public String getType(){return type;}
  public void setType(String newType){
    if(!newType.equals("fallen") && !newType.equals("falling") && !newType.equals("wall")){
      
    throw new IllegalArgumentException("Invalid type " + newType + " for block");}else{
        
  type = newType;}
  }
  
  public void setColor(color toSet){
    c = toSet;}
  
  public color getColor(){return c;}
  
  public void fall(){
  this.piece = null; //no longer belongs to any piece
  }
}
