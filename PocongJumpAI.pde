final int hidden_layers = 2;
final int hidden_nodes = 5;
final float gravity = 0.3;
final float mutationRate = 0.01; 
final boolean humanPlaying = false;
final boolean replayBest = true;

int highscore = 0;

Pocong player;

Population pop;

void setup() {
  frameRate(120);
  size(600,680);
  if(humanPlaying) {
    player = new Pocong();
  } else {
    pop = new Population(200); 
  }
}

void draw() {
   background(200);
   if(humanPlaying) {
     if(keyPressed) {
        if(key == 'a') {
          player.moveLeft();
        }
        if(key == 'd') {
          player.moveRight();
        } 
     }
     player.move();
     player.show();
     if(player.dead) {
        highscore = player.score;
        player = new Pocong(); 
     }
     fill(0);
     textAlign(CORNER,TOP);
     textSize(30);
     text("Score : "+player.score, 10, 10);
     text("Highscore : "+highscore, 10, 50);
   } else {
      if(pop.done()) {
         highscore = pop.bestPocong.score;
         pop.calculateFitness();
         pop.naturalSelection();
      } else {
         pop.update();
         pop.show();
      }
      fill(0);
      textAlign(CORNER,TOP);
      textSize(30);
      text("Score : "+pop.bestPocong.score, 10, 10);
      text("Highscore : "+highscore, 10, 50);
      text("POCONG AI SLURR", 10, 90);
      text("Gen : "+pop.gen, 450, 10);
      
      
   }
}

void keyReleased() {
   if(key == 'a' || key == 'd') {
    player.moveStop();
  } 
}
