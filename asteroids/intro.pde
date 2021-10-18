void intro(){
  textFont(edge);
  textAlign(CENTER,CENTER);
  textSize(40);
  fill(#3EDE1F); 
  text("Asteroids",400,200);
  textSize(30);

  fill(255,0,0);
  rectMode(CENTER);
   rect(width/2,height/2,350,150);
  rectMode(CORNER);
  fill(#3EDE1F);
  text("Start",400,440);
  
}




void introClicks(){
  mode = game;
  
}
