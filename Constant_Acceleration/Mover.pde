class Mover
{
    PVector location = new PVector(width/2,height/2);
    PVector velocity = new PVector(0,0);
    PVector acceleration = new PVector(-0.001,0.01);
    float max;

void display()
  {
    background(255);
    fill(150);
    ellipse(location.x,location.y,32,32);
    println(velocity);
  }  

void update() 
  {
    max = 20;
    velocity.add(acceleration);
    velocity.limit(max);
    location.add(velocity);
  }

void checkEdges()
  {
    if(location.x > width) {
      location.x = 0;
      } else if ( location.x < 0) {
      location.x = width; 
   }
     if(location.y > height) {
      location.y = 0;
     } else if ( location.y < 0) {
      location.y = height; 
  }
 }
}
