// ****************************************************
// TITLE:        Bouncing Notes
// DESCRIPTION:  MUSI6002 Interactive Music Project3
// AUTHOR:       ALICE CHEN
// DATE:         Jan 2016
// ****************************************************

// import library
import ddf.minim.*;
import controlP5.*;
import arb.soundcipher.*;
SoundCipher sc;
ControlP5 cp5;
Slider2D s;
CheckBox checkbox;

// global variables
// create a palette class instance
palette ballColors;
//ArrayList<Note> notes; 
ArrayList<Note> notes;  // dots is initially null

// number of grids
float gridX;
float gridY;

// bounds
float[] bound;

// colors
color gridColor = color(225, 225, 225);
color C0;  // toggle off
color C1;  // toggle on

// notes
int direction = 0;

// set up the sound variables
Minim minim;
ArrayList<AudioPlayer> balls;
AudioPlayer now;

void setup(){
  // draw canvas
  size(800, 600);
  background(255);
  smooth();
  
  // initialize 
  ballColors = new palette();
  notes = new ArrayList<Note>(); // make an empty ArrayList of dots
  bound = new float[2];
  bound[0] = 550 - 7.5;
  bound[1] = 50 + 7.5;
  C0 = color(ballColors.river);  // initial ball color
  C1 = color(ballColors.sea);
  
  // GUI elements
  cp5 = new ControlP5(this);
  // Slider2D
  s = cp5.addSlider2D("density")
         .setPosition(600,50)
         .setSize(100,100)
         .setMinMax(10,10,50,50)
         .setValue(25,25)
         ;
  // audio
  minim = new Minim(this);
  now = minim.loadFile("Cabassa3.mp3");
  balls = new ArrayList<AudioPlayer>();
  AudioPlayer ball1 = minim.loadFile("Cabassa3.mp3"); balls.add(ball1);
  AudioPlayer ball2 = minim.loadFile("SeedShellShaker7.mp3"); balls.add(ball2);
  AudioPlayer ball3 = minim.loadFile("Frame Drum0_2.mp3"); balls.add(ball3);
  AudioPlayer ball4 = minim.loadFile("MGF-99-AJVHS-05.mp3"); balls.add(ball4);
  AudioPlayer ball5 = minim.loadFile("MGF-99-AJVHS-25.mp3"); balls.add(ball5);
  AudioPlayer ball6 = minim.loadFile("MGF-99-EGLITCH-15.mp3"); balls.add(ball6);
}

void draw(){
  background(255);
  ballColors.colorSelector();
  
  // draw background grids
  gridX = s.getArrayValue()[0];
  gridY = s.getArrayValue()[1];
  stroke(gridColor);
  strokeWeight(0.5);
  float stpX = 500 / gridX;
  float stpY = 500 / gridY;
  line(50, 50, 550, 50);
  line(50, 550, 550, 550);
  line(50, 50, 50, 550);
  line(550, 50, 550, 550);
  for (int i=1; i<gridX; i++){
    line(50+stpX*i, 50, 50+stpX*i, 50+stpX*gridX);
  }
  for (int j=1; j<gridY; j++){
    line(50, 50+stpY*j, 50+stpY*gridY, 50+stpY*j);
  }
 
  
  // draw the lines
  Note prev = null;
  for (Note n : notes) {
    if (prev != null) {
      stroke(0);
      strokeWeight(0.4);
      line(n.x, n.y, prev.x, prev.y);
    }
    prev = n;
  }

  // draw the dots
  for (Note n : notes) {
    n.render();
    n.update();
  }
  
  // wipe out edges
  noStroke();
  fill(255);
  rect(0, 0, 500, 50);
  rect(0, 0, 50, 500);
  rect(50, 551, 500, 50);
  rect(551, 50, 50, 500);
}