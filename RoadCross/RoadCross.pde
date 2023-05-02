import processing.sound.*;
import de.looksgood.ani.*;

Squirrel s;
int nCars = 12;
Cars[] z = new Cars[nCars];
boolean test = false;
Synth boing;
PFont myfont;
PImage img;

static final int SPLASH = 0;
static final int PLAY = 1;
static final int LOSE = 2;
static final int WIN = 3;
int gameState = SPLASH;
int speed = 0;
int counter = 0;



void setup()
{
  size(1200,800);
  //fullScreen();
  Ani.init(this);
  myfont = createFont("Heebo.ttf",100);
  gameStateChange(SPLASH);
  img = loadImage("Ground_Test.png");
  
}

void draw()
{
  if(gameState == SPLASH) splash_run();
  if(gameState == PLAY) game_run();
  if(gameState == LOSE) LOSE_run();
}

void keyPressed()
{
  if(gameState == SPLASH) splash_keyPressed();
  if(gameState == PLAY) game_keyPressed();
  if(gameState == LOSE) LOSE_keyPressed();
}

void mouseClicked()
{
  if(gameState == SPLASH) splash_mouseClicked();
  if(gameState == PLAY) game_mouseClicked(); 
  if(gameState == LOSE) LOSE_mouseClicked();
}

void gameStateChange(int state)
{
  gameState = state;
  if(gameState == SPLASH) splash_init();
  if(gameState == PLAY) game_init();
  if(gameState == LOSE) LOSE_init();
}

/*lose stuff begin---------------------------------*/
void LOSE_init()
{
  s = new Squirrel("test");
}

void LOSE_run()
{
  background(0,0,0);
  fill(255,255,255);
  textAlign(CENTER);
  textSize(200);
  text("YOU LOSE",width/2, height/2);
  textAlign(CENTER);
  textSize(50);
  text("Press ANY key to Restart", width/2, height-300);
  counter = 0;
}

void LOSE_keyPressed()
{
  gameStateChange(PLAY);
}

void LOSE_mouseClicked()
{

}
/*splash stuff end-00--------------------------------*/

/*splash stuff begin---------------------------------*/
void splash_init()
{
  s = new Squirrel("test");
}

void splash_run()
{
  background(100,100,200);
  textFont(myfont);
  textAlign(CENTER);
  textSize(150);
  text("Cross the Road",width/2, height/2);
  textSize(40);
  fill(255);
  text("Press ANY key to Start",width/2,height/2+100);
  s.display();
}

void splash_keyPressed()
{
  gameStateChange(PLAY);
}

void splash_mouseClicked()
{

}
/*splash stuff end-00--------------------------------*/


/*game stuff begin---------------------------------*/
void game_init()
{
  boing = new Synth(this,1);
  s = new Squirrel("test");
  for(int i =0; i < nCars; i =  i + 1)
  {
    z[i] = new Cars("snake"+i);
  }   
}

void game_run()
{
    background(0);
    image(img, 0, 0);
//  fill(230);
//  rect(100,100,width-200,height-200);
  s.display();
  s.update();
  s.check();
  for(int i =0; i < nCars; i =  i + 1)
  {
    z[i].display();
    z[i].update();
    z[i].check();
  }  
  boing.display();
  boing.update();
  fill(50);  
  rect(0,675,width,220);
  fill(255);
  text("Roads Crossed:", width/2, 725);
  text(counter,width/2, 775);
  fill(50);
  rect(0,0,width,75);
  fill(255);
  
}

void game_keyPressed()
{
  s.acceleration.x = s.acceleration.x = (10);
  s.velocity.x = s.acceleration.x = (10);   
    if (keyPressed) {
   if (key == ' ' || key == ' ') {
      s.acceleration.x = s.acceleration.x + (1.0);
      s.velocity.x = s.acceleration.x + (1.0);
    }
       if (key == 'w' || key == 'W') {
      s.acceleration.x = s.acceleration.x * (0);
      s.velocity.x = s.acceleration.x * (0);
    }
   else 
  {
    s.acceleration.x = s.acceleration.x * (0);
  }
}
}

 // s.acceleration.x = s.acceleration.x * (-1.0);
//  s.velocity.x = s.acceleration.x * (-1.0);


void game_mouseClicked()
{
  //boing.frequency = random(60,6000);
   boing.hit();
}
/*game stuff end---------------------------------*/
