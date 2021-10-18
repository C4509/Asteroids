class GameObject {
  //instance variables
  int lives;
  PVector location;
  PVector velocity;
  int size;
  //constructor
  GameObject() {
  }
  //behaviour functions
  void show() {
  }
  void act() {

    location.add(velocity);
//wrapping
    if (location.y<-50) {
      location.y = height+50;
    }
    if (location.y>height+50) {
      location.y = -50;
    }
    if (location.x<-50) {
      location.x = width+50;
    }
    if (location.x>width+50) {
      location.x = -50;
    }
  }
}
