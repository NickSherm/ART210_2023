class Squirrel extends Sprite
{
  float maxSpeed = 3;
  
  Squirrel(String id)
  {
    super(id);
    this.acceleration = new PVector(0.05,0);
    this.registerAnimation(new Animation("Squirrel","svg"));
    this.registerAnimation(new Animation("Squirrel_R","svg"));
    this.registerAnimation(new Animation("Squirrel_S","svg"));
    this.scale = 2;
    this.h = 120;
    this.location.y = height-this.h-100;
    this.location.x = width+50;
  }
  
  void check()
  {
    Collision coll = new Collision(this,true);
    int res = coll.box2circle(100,100,width-200,height-200,false);
    if(res == Collision.RIGHT)
    {
      this.acceleration.x = this.acceleration.x - (.1);
      this.velocity.x = this.velocity.x - (.1);
    }
    if(res == Collision.LEFT)
    {
      
      gameStateChange(PLAY);
      counter = counter + 1;
    }
    this.velocity.limit(this.maxSpeed);
    if(this.velocity.x < 0)
    {
      this.currentAnim = 0;
    }
   else
    {
      this.currentAnim = 1;
    }
    
   if(this.velocity.x > -0.01 && this.velocity.x < 0.01)
   {
    this.currentAnim = 2; 
   }
  }
}
