class Fire extends GameObject {

  //instance variables
  int t;
  PVector nudge;
  //constuctor
  Fire() {
    lives = 1;
    size = 10;
    t = 255;
    //postion 
    location = myShip.location.copy();
    nudge = myShip.location.copy();
    //velocity
    velocity = myShip.velocity.copy();
    velocity.rotate(PI+random(-0.5, 0.5));//180 degrees
    velocity.setMag(5);
    nudge.rotate(PI);
    nudge.setMag(5);
    location.add(nudge);
  }

  //behaviour functions 
  void show() {
    if (mode == game) {
      noStroke();
      fill(242,118,22, t);
      square(location.x, location.y, size);
    }
  }
  void act() {
    if (mode == game) {
      super.act();
      t = t - 5;
      if (t <= 0) {
        lives = 0;
      }
    }
  }
}
