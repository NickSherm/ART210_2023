float _cy = 0.0;  //This is a place for the circle's position
float _cx = 0.0;
float _cdx = 10;
float _cdy = 10;

void setup()
{
  size(800,600);
  
}

void draw()
{
  drawCircle(random(width),random(height));
  drawCircle(_cx,_cy);
  _cx = update(_cx,_cdx);
  _cy = update(_cy,_cdy);
  _cdx = check(_cx,_cdx,0,width);
  _cdy = check(_cy,_cdy,0,height);
 }

 float update(float value, float increment)
 {
  return(value + increment);
 }
 
 float check(float value, float delta, float lower_limit, float upper_limit)
 {
   if(value > upper_limit || value < lower_limit)
  {
    return(delta * (-1));
  }
  return(delta);
 }
 
 void drawCircle(float x, float y)
 {
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  fill(255);
  circle(x,y,40);  //Drawing the circle
 }
   /*
 
 
 */
