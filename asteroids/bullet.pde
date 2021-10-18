class Bullet extends GameObject{
  //instance variables
  int timer;  
  int size;
    //constructors
  Bullet(){
    timer=500;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.velocity.x, myShip.velocity.y);
    velocity.setMag(10);
    size = 10;
  }
    
  //behaviour functions
  void show(){
    if (mode == game){
    stroke(255);
    fill(#F27616);
    ellipse(location.x, location.y,size,size);
    }
  }
  void act(){
if (mode == game)    {
super.act();
timer--;
    if(timer ==0){
      lives = 0;}
    }
    
  }
}
