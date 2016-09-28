class Note extends Ball{
  Timer timer = new Timer();
  AudioPlayer audio;
  //Volume volume;
  
  void render(){
    super.render();
  }
  
  void init(){
    super.init();
    audio = now;
  }
  
  void update(){
    super.update();
    // downward
    if (dir == 0){ 
        if (y > (bound[0]-5)) {bcolor = c1;} else {bcolor = c0;}
        if (y >= bound[0]-1) {
          audio.setGain (timer.elapsedMillis()/50 - 50);
          timer.reset();
          audio.play(0);
        }
    }
    if (dir == 1){ 
        if (y < (bound[1]+5)) {bcolor = c1;} else {bcolor = c0;}
        if (y <= bound[1]+1) {
          audio.setGain (timer.elapsedMillis()/50 - 50);
          timer.reset();
          audio.play(0);
        }
    }
    if (dir == 2){ 
        if (x < (bound[1]+5)) {bcolor = c1;} else {bcolor = c0;}
        if (x <= bound[1]+1) {
          audio.setGain (timer.elapsedMillis()/50 - 50);
          timer.reset();
          audio.play(0);
        }
    }
    if (dir == 3){ 
        if (x > (bound[0]-5)) {bcolor = c1;} else {bcolor = c0;}
        if (x >= bound[0]-1) {
          audio.setGain (timer.elapsedMillis()/50 - 50);
          timer.reset();
          audio.play(0);
        }
    }
  }
}