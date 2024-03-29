class Mover
{
 PVector location = new PVector(0,0);
 PVector velocity = new PVector(0,0);
 PVector acceleration = new PVector(0,0);
 float topspeed = 10;
 
 Mover(float _x, float _y)
   {
     this.location.x = _x;
     this.location.y = _y;
     this.acceleration.y = -0.001;
     this.acceleration.y = 0.01;
   }
 
 void display()
   {
    fill(255);
    circle(this.location.x,this.location.y,40);
   }
 
 void update()
   {
     PVector mouse = new PVector(mouseX,mouseY);
     PVector dir = PVector.sub(mouse,location);
     dir.normalize();
    this.acceleration = dir.mult(0.5);
    this.velocity.add(this.acceleration);
    this.velocity.limit(topspeed);
    this.location.add(this.velocity); 
   }
 
 void check()
  {
  /* if(this.location.x < 0 || this.location.x > width)   this.velocity.x = this.velocity.x * (-1);
   if(this.location.y < 0 || this.location.y > height)  this.velocity.y = this.velocity.y * (-1); */
   if(this.location.x < 0) this.location.x = width;
   if(this.location.x > width) this.location.x = 0;
   if(this.location.y < 0) this.location.y = width;
   if(this.location.y > width) this.location.y = 0;
  }
}
