public class Block{

  color c = 0;
   int col;
  int row; //x's and ys relative to center.
  String type;


  Block(int col, int row){
    this.col = col;
    this.row = row;
    this.type = "falling";
  }
  Block(int col, int row, int c){
    this(col, row);
    this.c = c;
  }
  
  
  Block(String type){

    this.c = color(0,0,83);
    this.type = "type";
  }
  
  
  Block clone() {
     Block b = new Block(this.col, this.row);
     b.setColor(this.c);
     return b;
  }

 

  public int getCOffset(){return this.col;}
  public int getROffset(){return this.row;}

  public String toString(){
    return "Block of type " + type + " and color " + c + " row " + row + " column " + col;
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

}
