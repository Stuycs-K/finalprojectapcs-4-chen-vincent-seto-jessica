public class Block{
  
  color c;
  String type;
  Piece piece;
  
  Block(color c, String type, Piece piece){
    this.c = c; 
    this.type = type;
    this.piece = piece;
  }
  
  public String getType(){return type;}
  public void setType(String newType){
    if(!newType.equals("fallen") || !newType.equals("falling") || !newType.equals("wall")){
      
    System.out.println("invalid type");}else{
        
  type = newType;}
  }
  
  public void setColor(color toSet){
    c = toSet;}
  
  public color getColor(){return c;}
    
}
