// This particle system is based on code from http://www.cs.sfu.ca/CourseCentral/166/tjd/particle_systems.html
// control boundcing balls
// include movements
class Sprite {
  float x;
  float y;
  float dx;
  float dy;

  void update() {
    x += dx;
    y += dy;
  }
}

class Ball extends Sprite {
  float[] gravity = new float[2];
  float[] elasticity = new float[2];
  int dir;
  color bcolor;
  color c0;
  color c1;
  
  void init(){
    c0 = C0;
    c1 = C1;
    bcolor = c0;
    dir = direction;  
  }
  void render() {
    fill(bcolor);
    noStroke();
    ellipse(x, y, 15, 15);
  }

  void update() {
    super.update();

    gravity[0] = 2/s.getArrayValue()[0];
    gravity[1] = 2/s.getArrayValue()[1];
    elasticity[0] = gravity[0]*9;
    elasticity[1] = gravity[1]*9; 
    // downward
    if (dir == 0){  
        dy += gravity[0];
        if (y >= bound[0]) {  // check if dot has hit the bottom edge
          dy = -(dy * elasticity[0]);
          y = bound[0] - 1;
        } 
    }
    // upward
    if (dir == 1){
        dy -= gravity[0];
        if (y <= bound[1]) {  // check if dot has hit the bottom edge
          dy = - (dy * elasticity[0]);
          y = bound[1] + 1;
        }
    }
    // leftward
    if (dir == 2){ 
        dx -= gravity[1];
        if (x <= bound[1]) {  // check if dot has hit the bottom edge
          dx = -(dx * elasticity[1]);
          x = bound[1] + 1;
        }
    }
    // rightward
    if (dir == 3){ 
        dx += gravity[1];
        if (x >= bound[0]) {  // check if dot has hit the bottom edge
          dx = -(dx * elasticity[1]);
          x = bound[0] - 1;
        }
    }
  }
} // class Dot