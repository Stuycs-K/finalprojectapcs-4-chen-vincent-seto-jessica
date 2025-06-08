public class Block{
  String powerup = "none"; //Freeze pauses the game, Score buffs the score, 
  color c = 0;
   int col;
  int row; //x's and ys relative to center.
  String type;
  PImage image;
  
  static final String snowflake_img = "flake3.png";
  static final String score_img = "star.png";
  static final String stash_img = "thluffy.png";
  Block(int col, int row){
    this.col = col;
    this.row = row;
    this.type = "falling";
    if(Math.random() <0.1){ //gives a 10% chance to spawn w/ a powerup
       int powerUp = (int) (Math.random() * 3);
       if(powerUp == 0){
         powerup = "freeze";
         image = loadImage(snowflake_img);
    }else if(powerUp == 1){
      powerup = "score";
      image = loadImage(score_img);  
  }else if(powerUp == 2){
    powerup = "stash";
    image = loadImage(stash_img);
  }}}
  
  Block(int col, int row, int c, String powerUp){
    this(col, row);
    this.c = c;
    this.powerup = "none";
    this.image = null;
    this.powerup = powerUp;
    if(powerup.equals("freeze")){
         image = loadImage(snowflake_img);
  }else if(powerup.equals("score")){
      image = loadImage(score_img);  
    }else if(powerup.equals("stash")){
    image = loadImage(stash_img);}
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
