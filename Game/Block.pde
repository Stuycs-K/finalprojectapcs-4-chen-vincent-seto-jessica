public class Block{
  String powerup = "none"; //Freeze pauses the game, Score buffs the score, 
  color c = 0;
   int col;
  int row; //x's and ys relative to center.
  String type;
  PImage image;


  Block(int col, int row){
    this.col = col;
    this.row = row;
    this.type = "falling";
    if(Math.random() < 1){ //gives a 5% chance to spawn w/ a powerup
       int powerUp = (int) (Math.random() * 2);
       if(powerUp == 0){
         powerup = "freeze";
         image = loadImage("snowflake.jpg");
    }else if(powerUp == 1){
      powerup = "score";}
  }}
  
  Block(int col, int row, int c){
    this(col, row);
    this.c = c;
  }
  
 
 PImage getImage(){return image;}
  Block(String type){

    this.c = color(0,0,83);
    this.type = type;
  }
  
  
  Block clone() {
     Block b = new Block(this.col, this.row);
     b.setColor(this.c);
     return b;
  }

 
  public String getPower(){return this.powerup;}
  public int getCOffset(){return this.col;}
  public int getROffset(){return this.row;}

  public String toString(){
    return "type " + type + " color " + c + " row " + row + " column " + col;
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
