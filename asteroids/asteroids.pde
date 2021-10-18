//Cierra Cheung
//October 7, 2021
//note for Mr.Pelletier: I couldn't figure out how to make the teleport function work, 
//however, I decided to just leave the code in the file. Also, the ship may have to fully
//pass through an asteroid or UFO bullet to register a hit and enter immunity.
//mode framework
int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameover = 3;
//key
boolean upkey, downkey, rightkey, leftkey, spacekey, akey;
//classes
Ship myShip;
ArrayList<GameObject> myObjects;
//fonts
PFont edge;
PImage[] gif;
int NumberOfFrames;
int f;
//misc
  int timer = 0;
  int placeholder= 500;
  int time = 0;
  int score = 0;
void setup() {
  size(800, 800);
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(myShip);
     
  //initialize font
       edge = createFont("EdgeOfTheGalaxyRegular-OVEa6.otf", 80);
     //initialize gif
   NumberOfFrames = 46;
   gif = new PImage[NumberOfFrames];
   int i = 0;
   while(i < NumberOfFrames){
     gif[i] = loadImage("ezgif-6-1fb556f7e96b-gif-im/frame_"+i+"_delay-0.04s.gif");
     i++;
   }
   f= 0;

 }


void draw() {
    //load gif
      image(gif[f], 0,0, width, height);
  f=f+1;
  if (f == NumberOfFrames){f=0;}
  //mode framework
  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
