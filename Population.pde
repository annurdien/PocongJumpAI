class Population {
   Pocong[] pocong;
   
   Pocong bestPocong;
  
   int gen = 0;
   
   float fitnessSum;
   float bestFitness = 0;
  
   Population(int size) {
       pocong = new Pocong[size];
       for(int i=0; i<size; i++) {
          pocong[i] = new Pocong(); 
       }
       bestPocong = pocong[0];
   }
   
   void show() {
     if(!replayBest) {
        for(int i=0; i<pocong.length; i++) {
           pocong[i].show(); 
        }
     } else {
        bestPocong.show(); 
        bestPocong.brain.show(10,height-160,200,150,bestPocong.vision,bestPocong.decision);
     }
   }
   
   void update() {
     if(!bestPocong.dead) {
        bestPocong.look();
        bestPocong.think();
        bestPocong.move();
     }
     for(int i=0; i<pocong.length; i++) {
        if(!pocong[i].dead) {
           pocong[i].look();
           pocong[i].think();
           pocong[i].move(); 
        }
     }
   }
   
   boolean done() {
      for(int i=0; i<pocong.length; i++) {
         if(!pocong[i].dead) {
            return false; 
         }
      }
      if(!bestPocong.dead) {
         return false; 
      }
      return true;
   }
   
   void calculateFitness() {
     fitnessSum = 0;
     for(int i=0; i<pocong.length; i++) {
        fitnessSum += pocong[i].calculateFitness(); 
     }
   }
   
   void setBestPocong() {
      int bestIndex = 0;
      float best = 0;
      for(int i=0; i<pocong.length; i++) {
          if(pocong[i].fitness > best) {
             best = pocong[i].fitness;
             bestIndex = i;
          }
      }
      if(best > bestFitness) {
        bestFitness = best;
        bestPocong = pocong[bestIndex].cloneReplay();
        bestPocong.replay = true;
        println("Gen "+gen+" Best Fitness "+bestFitness);
      } else {
        bestPocong = bestPocong.cloneReplay(); 
      }
   }
   
   Pocong selectPocong() {
      float rand = random(fitnessSum);
      float runSum = 0;
      for(int i=0; i<pocong.length; i++) {
        runSum += pocong[i].fitness;
        if(runSum > rand) {
            return pocong[i];
        }
      }  
      return pocong[0];
   }
   
   void naturalSelection() {
        setBestPocong();
        
        Pocong[] newPocong = new Pocong[pocong.length];
        newPocong[0] = bestPocong.clone();
        for(int i=1; i<newPocong.length; i++) {
            Pocong child = selectPocong().breed(selectPocong());
            child.mutate();
            newPocong[i] = child;
            
        }
        pocong = newPocong.clone();
        gen+=1;
     
   }
   
   
   
   
}
