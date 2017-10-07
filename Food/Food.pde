PFont font;
//import processing.sound.*;
//SoundFile file;
PImage background;
int COUNT =7;
PImage fries;
int m = 100  ;
int napTime = 1;
PImage hamburger;
PImage hotdog;
PImage nuggets;
PImage drink;
PImage coke;
PImage ketchup;
int y = 20;
float[] Xs = new float[COUNT];
float[] Ys= new float[COUNT];
float[] Speed =new float [COUNT];
int[] Type = new int [COUNT];
int Xrect = 200;
int Yrect = 580;
int x = 200;
void setup()
{
  //file = new SoundFile(this, "bonapetit.mp3");
  //file.loop();
  size (600, 700);
  Isettings();
  loadFile();
  textFont(font, 30);
}
void draw()
{
  image(background, 0, 0, 1200, 1400);
  Ingredients();
  Deco();
  Rectangle();
  WIN();
  CheckColision();
}
void WIN()
{
  if (Yrect<0)
  {
    fill(0);
    textSize(160);
    text("WIN", 150, 375);
    
    //exit();
  }
}
void CheckColision()
{
  for (int i = 0; i<COUNT; i++)
  {
    if (Xs[i] < Xrect + x &&
      Xs[i] + m > Xrect &&
      Ys[i] <  Yrect + y &&
      m+ Ys[i] > Yrect)
    {
      fill(0);
      textSize(160);
      text("FAIL", 150, 375);


      exit();
    }
  }
}

void loadFile()
{
  ketchup = loadImage ("ketchup.png");
  fries = loadImage ("fries.png");
  hotdog = loadImage ("hotdog.gif");
  hamburger = loadImage ("hamburger.png");
  drink = loadImage ("drink.png");
  coke = loadImage ("coke.png");
  nuggets = loadImage ("nuggets.png");
  background = loadImage ("background.jpg");
  font=loadFont("bonapetit.vlw");
}
void Isettings()
{
  for (int i = 0; i<COUNT; i++)
  {
    Xs[i] = random(width+m, width-m);
    Ys[i] = random (-m, 0);
    Speed[i] = random (3, 5);
    Type [i] = (int)random(7);
  }
}
void Ingredients()
{
  for (int i = 0; i<COUNT; i++)
  {
    if (Type[i]==0)
    {
      image (fries, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==1)
    {
      image (ketchup, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==2)
    {
      image (nuggets, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==3)
    {
      image (hamburger, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==4)
    {
      image (hotdog, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==5)
    {
      image (drink, Xs[i], Ys[i], m, m);
    }
    if (Type[i]==6)
    {
      image (coke, Xs[i], Ys[i], m, m);
    }
    Ys[i]=Ys[i]+Speed[i];
    if (Ys[i]>height)
    {
      Xs[i] = random(width);
      Ys[i] = random (-500, 0); 
      Type [i] = (int)random(7);
    }
  }
}
void Deco ()
{
  for (int i =0; i<800; i++)
  {
    noStroke();
    fill(255, 255, 255);
    ellipse(i*120+60, 40, 160, 160);
  }
  fill(180, 80, 80);
  textSize(80);
  text("Bon Apétit", 140, 70);
}
void Rectangle ()
{
  fill(255);
  rect(Xrect, Yrect, x, y);
  if (keyPressed)
  {
    if (key=='d')
    {
      Xrect=Xrect+5;
    }
    if (key=='q')
    {
      Xrect=Xrect-5;
    }
    if (key=='w')
    {
      Yrect=Yrect+5;
    }
    if (key=='z')
    {
      Yrect=Yrect-5;
    }
  }
  if (Xrect > 600)
  {
    Xrect = -x;
  }
  if (Xrect < -x)
  {
    Xrect = 600;
  }
}