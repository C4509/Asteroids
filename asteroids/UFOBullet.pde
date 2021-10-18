class UFOBullet extends GameObject{
  //instance variables
  int timer;  
  int size;
    //constructor
  UFOBullet(float x, float y,float vx, float vy){
     timer=500;
    location = new PVector(x,y);
   lives = 1;
    velocity = new PVector(vx,vy);
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
