class Cars extends Sprite
{
  float maxSpeed = 3;
  int[] numbers = {300, 500, 700, 900,}; // an array of whole numbers
  int randomIndex = int(random(numbers.length)); // generates a random index within the length of the array
  int randomNum = numbers[randomIndex];
  
  Cars(String id)
  {
    super(id);
    this.acceleration = new PVector(0,0.07);
    this.registerAnimation(new Animation("Car","svg"));
    this.location.y = -800;
    this.rotation = 0;
    this.scale = .4; 
    this.w = 50;
    this.h = 0;
    this.reg.x=this.w;
    this.reg.y=this.h;
    this.collRadius=this.w*2;
    this.translation.y=this.h / (-1.5);
  }
  
  void check()
  {
    Collision coll = new Collision(this,true);
    int res = coll.box2circle(100,100,width-200,height-200+this.h,false);
    if(res == Collision.BOTTOM)
    {
      this.location.y = -this.h-random(100, 1000);
      this.location.x = numbers[randomIndex] + random(-10,10);
      this.velocity.x = 0;
      this.velocity.y = 5;
      this.acceleration.y = .0;      
    }
    
    res = coll.circle2circle(s);
    if(res == Collision.IN)
    {
      boing.hit();
      gameStateChange(LOSE);
    }
    
  }
  
  
}
