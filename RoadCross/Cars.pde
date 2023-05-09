class Cars extends Sprite
{
  float maxSpeed = 8;
  int[] numbers = {700, width/2 , 300}; // an array of whole numbers
  int randomIndex = int(random(numbers.length)); // generates a random index within the length of the array
  int randomNum = numbers[randomIndex];


  Cars(String id)
  {
    super(id);
    this.acceleration = new PVector(0,0.07);
    this.registerAnimation(new Animation("Car_R","svg"));
    this.registerAnimation(new Animation("Car_B","svg"));
    this.registerAnimation(new Animation("Car_G","svg"));
    this.location.y = 1500;
    this.rotation = 0;
    this.scale = .5; 
    this.w = 50;
    this.h = 0;
    this.reg.x=this.w;
    this.reg.y=this.h;
    this.collRadius=this.w*3.5;
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
      this.velocity.y = 10;
      this.acceleration.y = .0;    
      this.currentAnim = int(random(0,3));
    }
/*
    res = coll.circle2circle(c);
    if(res == Collision.IN)
    {
     this.location.y = this.h + random(500, 750);
    }
*/

    res = coll.circle2circle(s);
    if(res == Collision.IN)
    {
      boing.hit();
      gameStateChange(LOSE);
    }
    
  }
  
  
}
