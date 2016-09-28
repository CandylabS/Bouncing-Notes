// color selecter
class palette{
  color taro = color(214, 214, 255);
  color rice = color(255, 245, 219);
  color river = color(178, 220, 252);
  color watermelon = color(255, 146, 124);
  color moon  = color(255, 250, 134);
  color mint = color(216, 255, 144);
  color orange = color(255, 215, 139);
  
  color purple = color(106, 114, 255);
  color sea = color(70, 144, 234);
  color blood = color(255, 0, 0);
  color leaf = color(111, 219, 66);
  color star = color(255, 247, 0);
  color citrus = color(255, 176, 3);

  void colorSelector(){
    noStroke();
    fill(taro);
    ellipse(610, 200, 15, 15);
    fill(river);
    ellipse(650, 200, 15, 15);
    fill(watermelon);
    ellipse(690, 200, 15, 15);
    fill(moon);
    ellipse(610, 250, 15, 15);
    fill(mint);
    ellipse(650, 250, 15, 15);
    fill(orange);
    ellipse(690, 250, 15, 15);    
  }
  
  void colorPick(){
    if (cursorInCircle(610, 200)){C0=taro; C1=purple; now=balls.get(0);}
    if (cursorInCircle(650, 200)){C0=river; C1=sea; now=balls.get(1);}
    if (cursorInCircle(690, 200)){C0=watermelon; C1=blood; now=balls.get(2);}
    if (cursorInCircle(610, 250)){C0=moon; C1=star; now=balls.get(3);}
    if (cursorInCircle(650, 250)){C0=mint; C1=leaf; now=balls.get(4);}
    if (cursorInCircle(690, 250)){C0=orange; C1=citrus; now=balls.get(5);}
  }
}