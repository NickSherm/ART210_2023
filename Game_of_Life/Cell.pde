class Cell
{
 float d = 10.0; //width & height
 int px = 0; //X position
 int py = 0; //Y position
 boolean isLive = false;
 boolean nextLive = false;
 
 Cell(int _px, int _py, float _d)
 {
   this.px = _px;
   this.py = _py;
   this.d = _d;
 }
 
 void display()
 {
  if(isLive)
  {
    fill(255);
  }
  else
  {
   fill(100); 
  }
  noStroke();
  rect(this.px * this.d, this.py * this.d,this.d,this.d); 
 }

void click(int mx,int my)
  {
    if
    (
    this.px*this.d < mx
    &&
    (this.px*this.d)+this.d > mx
    &&
    this.py*this.d < my
    &&
    (this.py*this.d)+this.d > my
    )
    {
    this.isLive = !this.isLive;
    }
  }


void check()
  {
    int nLiving = 0;
    int xminus = this.px-1;
    int xplus = this.px+1;
    int yminus = this.py - 1;
    int yplus = this. py + 1;
    if(xminus < 0) xminus = MaxX - 1;
    if(xplus > MaxX -1 ) xplus = 0;
    if(yminus < 0) yminus = MaxY - 1;
    if(yplus > MaxY -1 ) yplus = 0;
    
    if(cells[xminus][this.py].isLive) nLiving = nLiving + 1;
    if(cells[xplus][this.py].isLive)     nLiving = nLiving + 1;
    if(cells[this.px][yminus].isLive)    nLiving = nLiving + 1;
    if(cells[this.px][yplus].isLive)     nLiving = nLiving + 1;
    if(cells[xminus][yminus].isLive)     nLiving = nLiving + 1;
    if(cells[xplus][yplus].isLive)       nLiving = nLiving + 1;
    if(cells[xplus][yminus].isLive)      nLiving = nLiving + 1;
    if(cells[xminus][yplus].isLive)      nLiving = nLiving + 1;
    fill(color(255,100,100));
    
    if(this.isLive)
    {
     //rules for hte living 
     if(nLiving == 2 || nLiving == 3)
     {
      this.nextLive = true; 
     }
    else
    {
     //rules for the dead
     this.nextLive = false; 
     }
    }
    else
    {
      if(nLiving == 3)
      {
        this.nextLive = true;
      }
      else
      {
        this.nextLive = false;
      }
    }
    
    
    
    
    //Any live cell with two or three live neighours survivrs.
    //Any dead cell with three live neighbours becomes a lave cell.
    //All other live clels die in the next generation. Similarly, all other dead cells stay dead.
  }
  
}
