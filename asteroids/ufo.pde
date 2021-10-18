class UFO extends GameObject {
  //instance variables
  int shotTimer, threshold;
  //constructor
  UFO() {
    lives = 1;
    size = 70;
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    location = new PVector(random(width), random(height));
    shotTimer=0;
    threshold=100;
  }
  //behaviour functions 
  void show() {
    if (mode == game) {
      stroke(255);
      fill(255,0,0);
      circle(location.x, location.y, size);
    }
  }

  void act() {
    super.act();
    //die if off screen
    if (location.x > width && location.y > height||location.x < 0 && location.y == 0) {
      lives = 0;
    }
    //shoot bullets
    shotTimer++;
    if (  shotTimer >=threshold) {
      myObjects.add(new UFOBullet(location.x, location.y, myShip.location.x - location.x, myShip.location.y-location.y));
      shotTimer =0;
    } int i = 0;
    //initialize hit by bullet
      while (i <   myObjects.size()) {
        GameObject b =   myObjects.get(i);
        if (b instanceof Bullet) {
          if (dist(location.x, location.y, b.location.x, b.location.y)<=size/2+b.size) {
            b.lives=0;
            lives=0;
            //add particles
              myObjects.add(new Particle(location.x, location.y));
              myObjects.add(new Particle(location.x, location.y));
              myObjects.add(new Particle(location.x, location.y));
              myObjects.add(new Particle(location.x, location.y));
              myObjects.add(new Particle(location.x, location.y));
          }
        }
        i++;
      }
   
  }
}
