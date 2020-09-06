PImage falconPicture;
PImage kinkaidPicture;
PFont myFirstFont;

float falconx;
float falcony;
int falconSize = 75;
boolean overFalcon = false;
boolean locked = false;
float xOffset = 0;
float yOffset = 0;

//https://www.allaboutbirds.org/guide/Peregrine_Falcon/overview
//http://www.kirksey.com/portfolio/projects/the-kinkaid-school-dining-hall-learning-center
void setup()
{
  size (600, 600);
  falconPicture = loadImage("falcon.png");
  kinkaidPicture = loadImage("kinkaid.jpg");
  falconx = 500;
  falcony = 25;
  printArray(PFont.list());
  myFirstFont = createFont("Futura-CondensedExtraBold", 150);
  
}

void draw()
{
  image(kinkaidPicture, 0,0);
  
  fill(148,48,211);
  textFont(myFirstFont);
  text("KINKAID", 20,250);
  text("FALCONS", 20,450);
  
  
  //if the mouse is over the falcon
  if (mouseX > falconx - falconSize && mouseX < falconx + falconSize
      && mouseY > falcony - falconSize && mouseY< falcony + falconSize )
  {
    overFalcon = true;
  }
  
  else
  {
    overFalcon = false;
  }
  
  image(falconPicture, falconx, falcony, falconSize, falconSize);
  save("resultInWindow.png");
}

void mousePressed()
{
  if (overFalcon)
  {
    locked = true;
  }
  
  else
  {
    locked = false;
  }
  
  xOffset = mouseX - falconx;
  yOffset = mouseY - falcony;
}

void mouseDragged()
{
  if (locked)
  {
    falconx = mouseX - xOffset;
    falcony = mouseY - yOffset;
  }
}

void mouseReleased()
{
  locked = false;
}
