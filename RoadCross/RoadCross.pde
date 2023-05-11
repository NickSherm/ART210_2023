import processing.sound.*;
import de.looksgood.ani.*;

Squirrel s;
Cars c;
int nCars = 3;
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
int high = 0;



void setup()
{
  size(1200,1000);
  Ani.init(this);
  myfont = createFont("Gameplay.ttf",100);
  gameStateChange(SPLASH);
  img = loadImage("Road.png");
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
  textSize(150);
  text("YOU",width/2, height/2-200);
  text("LOSE",width/2, height/2-50);
  textAlign(CENTER);
  textSize(30);
  text("Press ANY key to Restart", width/2, height/2+200);
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
  text("Cross",width/2, height/2-200);
  textSize(75);
  text("the", width /2, height/2-112);
  textSize(150);
  text("Road",width/2, height/2 + 50);
    textSize(30);
  fill(255);
  text("Press ANY key to Start",width/2,height/2+200);
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
    image(img,0,-25);

  s.display();
  s.update();
  s.check();
  for(int i =0; i < nCars; i =  i + 1)
  {
    z[0].location.x = 700;
    z[1].location.x = 500;
    z[2].location.x = 300;

    z[i].display();
    z[i].update();
    z[i].check();

  }  
  
  boing.display();
  boing.update();
  
  noStroke();
 // fill(50);
//  rect(0,0,width,25);
  fill(50);  
  rect(1000,0,width/2,height);
  textSize(25);
  fill(255);
  text("High", width/1.09, height/7 );
  text("Score", width/1.09, height/5.9 );
  textSize(45);
  text(high,width/1.09, height/9);
  fill(255);
  textSize(25);
  text("Roads", width/1.09, height/3 );
  text("Crossed", width/1.09, height/2.78 );
  textSize(45);
  text(counter,width/1.09, height/3.35);
  fill(255);
  if(high < counter){
     high = high + 1; 
  }
  
  
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
