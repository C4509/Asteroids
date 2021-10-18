void gameover() {
  fill(#3EDE1F);
  textMode(CENTER);
  textSize(40);
  //win screen
  if(score >=45){
  text("You", 400, 200);
  text("Win!", 400, 350);
  }
  //lose screen
  if (myShip.lives <= 0) {
    text("You", 400, 200);
    text("Lose...", 400, 350);
  }
  text("Click To", 350, 550);
  text("Restart", 350, 700);
}

void gameOverClicks() {
  myShip.lives=3;
  mode = intro;
  score=0;
  setup();
}
