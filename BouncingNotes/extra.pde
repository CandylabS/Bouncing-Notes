// any self-defined functions
boolean cursorInGrid(float x, float y){
  if ((x > 50 && x < 550) && (y > 50 && y<550)){
    return true;
  }else{
    return false;
  }
}

boolean cursorInCircle(float x, float y){
  if (dist(x, y, mouseX, mouseY) < 7.5) {return true;}
  else {return false;}
}