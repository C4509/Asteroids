class Asteroid extends GameObject {
  //instance variables

  int size;
  //constructors
  Asteroid() {     
    lives = 1;
    size=100;
    location = new PVector(random(0, width), random(0, height));
    ;
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
  }
  Asteroid(int s, float x, float y) {
    lives = 1;
    size=100;
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }
  //behaviour functions
  void show() {
    if (mode == game) {
      stroke(255);
      fill(#03C6FA);
      ellipse(location.x, location.y, size, size);
    }
  }
  void act() {
    if (mode == game) {
      super.act();
      //if hit by bullet
      int i = 0;
      while (i <   myObjects.size()) {
        GameObject b =   myObjects.get(i);
        if (b instanceof Bullet) {
          if (dist(location.x, location.y, b.location.x, b.location.y)<=size/2+b.size) {
            b.lives=0;
            lives=0;

            score=score+1;  
            //show particles
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
            if (size >= 25) {
              myObjects.add(new Asteroid(size/2, location.x, location.y));
              myObjects.add(new Asteroid(size/2, location.x, location.y));
            }
          }
        }

        i++;
        //winning if all asteroids are destroyed
        if(score >= 45){
          mode = gameover;}
          if(mode == gameover){
            lives = 1;}
      }
    }

    }
  }
