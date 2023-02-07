int _nPlanets = 100;
float[] _speed = new float[_nPlanets];
float[] _angle = new float[_nPlanets];
float[] _dist = new float[_nPlanets];
float[] _size = new float[_nPlanets];
color[] _color = new color[_nPlanets];


void setup()
{
  size(1200,800);
  for(int i = 0; i < _nPlanets; i = i + 1)
  {
    _speed[i]=random(-1.8,1.8);
    _angle[i]=0.0;
    _dist[i]=random(100,400);
    _size[i]=random(20,50);
    _color[i]=color(random(255),random(255),random(255));
  }
}

void draw()
{
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
  
  translate(width/2,height/2);

  for(int i = 0; i < _nPlanets; i = i + 1)
  {
     drawPlanet(_angle[i],_dist[i], _size[i], _color[i]);
     _angle[i] = _angle[i] + _speed[i];
  }
}

void drawPlanet(float angle, float distance, float size, color c)
 {
 pushMatrix();
  rotate(radians(angle));
  translate(0,distance);
  fill(c);
  circle(0,0,size);  //Drawing the circle
  popMatrix();
 }
