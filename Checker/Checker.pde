int nRect = 8;

void setup()
{
  size(800,800);
} 
    
void draw()
{
  float d = width/nRect;
  noStroke();
  for(int y = 0; y < nRect; y = y + 1)
  {
    for(int x = 0; x < nRect; x = x + 1)
    {
     if((x+y) % 2 > 0)                          //Checkered Pattern
     //if(random(0,1) < 0.5)                   //Random Colors
     //if(random(0,1) < x/(nRect*2.0))         //Gradient
      {
        fill(0);
      }
      else
      {
        fill(255);
      }
      rect(x*d,y*d,d,d);
    //println("x = "+x+" y = "+y+" x+y= "+(x+y));    
    }
  }
}
