int nPlanets = 10;
ArrayList<planet> planets = new ArrayList<planet>();
 
void setup()
{
  size(1200,800);
  for(int i = 0; i < nPlanets; i = i + 1)
  {
   planets.add(new planet()); 
  }
}

void draw()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  translate(width/2,height/2);
  
 for(int i = 0; i < nPlanets; i = i + 1)
  {
   planet buf = planets.get(i);
   buf.draw();
   buf.update();
  }
  
}
