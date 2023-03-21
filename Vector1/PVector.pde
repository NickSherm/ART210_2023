class PVector
{
  float x = 0.0;
  float y = 0.0;
  
  PVector(float _x, float _y)
  {
   this.x = _x;
   this.y = _y;
  }
  
 void add(PVector v)
 {
  this.x = this.x + v.x;
  this.y = this.y + v.y;  
 }
  
}
