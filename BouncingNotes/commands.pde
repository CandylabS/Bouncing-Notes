// keyboard and mouse control

void mousePressed() {
  if (cursorInGrid(mouseX, mouseY)==true){
    Note n = new Note();
    n.x = mouseX;
    n.y = mouseY;
    n.init();
    notes.add(n);
  }
  ballColors.colorPick();
}

void keyPressed(){
  if (key == ' '){
    // all balls stop! audio stop!
    notes.clear();
  }
  
  if (key == 'c' || key == 'C'){
    // change ball timbre -> then change color?
  }
  
 // change notes
 if (key == '0'){
   direction = 0;
 }
 if (key == '1'){
   direction = 1;
 }
 if (key == '2'){
   direction = 2;
 }
 if (key == '3'){
   direction = 3;
 }
}