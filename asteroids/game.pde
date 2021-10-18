void game() {
  background(#07022E);
  int y = 300;

  //initialize ship
  myShip.show();
  myShip.act();
  //initialize bullets + asteroid
  int i = 0;
  while (i <   myObjects.size()) {
    GameObject b =   myObjects.get(i);
    b.act();   
    b.show();
    //initilize objects dying
    if (b.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

//initialize ufo
  timer ++;
  if (timer >=placeholder) {
    myObjects.add(new UFO());
    timer = 0;
  }

  if (myShip.lives<=0) {
    mode = gameover;
  }
  //pause button
  fill(#3EDE1F);
  rect(100, 600, 50, 50);
  fill(#07022E);
  rect(110,610,12,30);
  rect(127,610,12,30);
 //teleport cooldown indicator 

   if (myShip.time < y){
      fill(255,0,0);

    } else {
      fill(#0CF592);
    }
   rect(700,700,50,50); 
    
    }



void gameClicks() {

  //initalize pause
if  (mouseX > 100 && mouseX < 150 && mouseY > 600 && mouseY < 650){
  mode = pause;
}
}
