int n = 160;
float angle = 0;

void setup()
{
  size(800,800);
  noStroke();
  colorMode(HSB, 400);
} 
    
void draw()
{
 float d = width/n;
 for(int y = 0; y < n; y = y + 1)
 {
   for(int x = 0; x < n; x = x + 1)
    {
      float Hue = random(mouseX,mouseY+mouseY);
      float Sat = random (400,400);
      float Bri = random (200,400);
      fill(color(Hue,Sat,Bri));
      rect(x*d,y*d,d,d);
    }
  }
  angle = angle + 0.1;
  if(angle > 340) angle = 0;
}
