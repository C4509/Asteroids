class Ship extends GameObject {

  //instance variables

  PVector direction;
  int shotTimer, threshold;
  float t;
  int f;
  int time;
  //constructor
  Ship() {
    lives = 10;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 60;
    size = 60;
    t=100;
    f=100;
    time = 0;
  }

  //behaviour functions
  void show() {
    if (mode == game) {
      pushMatrix();
      translate(location.x, location.y);
      rotate(direction.heading());
      stroke(255);
      if (t>f) {
        fill(#CB92F5);
      } else if (t<f) {
        fill(#F7810A);
      } 

      triangle(-25, -12.5, -25, 12.5, 25, 0);

      popMatrix();
    }
  }

  void act() {
    super.act();
    if (velocity.mag() > 3) {
      velocity.setMag(3);
    }
    shotTimer ++;
    //direction control
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
    }
    if (downkey) { 
      velocity.sub(direction);
    }
    if (leftkey) {
      direction.rotate(-radians(5));
    }
    if (rightkey) {
      direction.rotate(radians(5));
    }
    if (spacekey&&shotTimer >=threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    //hit by asteroid or ufo bullet
    t++;
    int i = 0;
    while (i <   myObjects.size()) {
      GameObject b =   myObjects.get(i);

      if (b instanceof Asteroid) {
          if (dist(location.x, location.y, b.location.x, b.location.y)<=size/2+b.size/2 && t>=f) {
          lives = lives - 1;
            t = 0;
          
        }
        if (b instanceof UFOBullet) {
            if (dist(location.x, location.y, b.location.x, b.location.y)<=size/2+b.size/2 && t>=f) {
              t = 0;
              lives = lives - 1;
              b.lives = 0;
            
          }
          //immunity code

      
        }
      }
      i++;
    }



    //teleport function
        time++;
    if (akey) {
        
      if (time >= 500) {
          int x = 0;
        location = new PVector(random(width), random(height));
        while (x <   myObjects.size()) {
          GameObject q = myObjects.get(x);
          if (q instanceof Asteroid) {
            if (dist(location.x, location.y, q.location.x, q.location.y)<=size/2+100+q.size/2+100) {
              location = new PVector(random(height), random(width));
              time = 0;
            }
          }
               x++;    
        }
     
      }
    
    }

  }
}
