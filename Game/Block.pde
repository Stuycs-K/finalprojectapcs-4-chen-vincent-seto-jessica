public class Block{

  color c;
   int x;
  int y; //x's and ys relative to center.
  String type;


  Block(int xpos, int ypos){
    this.x = xpos;
    this.y = ypos;
    this.c = 0;
    this.type = "Template";
  }


  Block(){

    this.c = color(0,0,83);
    this.type = "wall";
  }


  public int getXOffset(){return this.x;}
  public int getYOffset(){return this.y;}


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
