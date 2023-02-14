planet sun = new planet(); 
planet mercury = new planet(); 
planet venus = new planet(); 
planet earth = new planet(); 
planet mars = new planet(); 
planet jupitor = new planet(); 
planet saturn = new planet(); 
planet uranus = new planet(); 
planet neptune = new planet(); 
planet pluto = new planet();
 
void setup()
{
  fullScreen();
  
  sun.dist = 0;
  sun.size = 40;
  sun.col = color(255,255,75);
  
  mercury.dist = 57.9;
  mercury.speed = 4.74;

  venus.dist = 108.2;
  venus.col = color(255,255,100);
  venus.speed = 3.5;
  
  earth.dist = 149.6;
  earth.col = color(100,100,255);
  earth.speed = 2.98;
  
  mars.dist = 228;
  mars.col = color(255,200,50);
  mars.speed = 2.41;
  
  jupitor.dist = 778;
  jupitor.col = color(255,200,50);
  jupitor.speed = 1.31;
  jupitor.size = 20;
  
  saturn.dist = 1432;
  saturn.col = color(255,255,175);
  saturn.speed = 0.97;
  saturn.size = 18;
  
  uranus.dist = 2167;
  uranus.col = color(100,200,255);
  uranus.speed = 0.68;
  uranus.size = 18;
  
  neptune.dist = 4515;
  neptune.col = color(100,200,255);
  neptune.speed = 0.54;
  neptune.size = 15;
  
  pluto.dist = 5906;
  pluto.col = color(255,255,255);
  pluto.speed = 0.47;
  pluto.size = 10;
  
}

void draw()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  translate(width/2,height/2);
  scale(0.15);
  
  sun.draw();
  sun.update();
  
  mercury.draw();
  mercury.update();
  
  venus.draw();
  venus.update();
  
  earth.draw();
  earth.update();
  
  mars.draw();
  mars.update();
  
  jupitor.draw();
  jupitor.update();
  
  saturn.draw();
  saturn.update();
  
  uranus.draw();
  uranus.update();
  
  neptune.draw();
  neptune.update();
  
  pluto.draw();
  pluto.update();
}
