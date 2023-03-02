class Cell
{
 float d = 10.0; //width & height
 int px = 0; //X position
 int py = 0; //Y position
 int pz = 0; //Z position
 boolean isLive = false;
 boolean nextLive = false;
 
 Cell(int _px, int _py, int _pz, float _d)
 {
   this.px = _px;
   this.py = _py;
   this.pz = _pz;
   this.d = _d;
 }
 
 void display()
 {
  if(isLive)
  {
  fill(255,100,100);
  noStroke();
  pushMatrix();
  translate((-MaxX/2)*this.d,(-MaxY/2)*this.d,(-MaxZ/2)*this.d);
  translate(this.px * this.d, this.py * this.d,this.pz * this.d);
  box(this.d);
  popMatrix();
  }
}


void check()
  {
    int nLiving = 0;
    int xminus = this.px-1;
    int xplus = this.px+1;
    int yminus = this.py - 1;
    int yplus = this. py + 1;
    int zminus = this.pz - 1;
    int zplus = this. pz + 1;
    if(xminus < 0) xminus = MaxX - 1;
    if(xplus > MaxX -1 ) xplus = 0;
    if(yminus < 0) yminus = MaxY - 1;
    if(yplus > MaxY -1 ) yplus = 0;
    if(zminus < 0) zminus = MaxZ - 1;
    if(zplus > MaxZ -1 ) zplus = 0;
    
    if(cells[xminus][this.py][this.pz].isLive)    nLiving = nLiving + 1;
    if(cells[xplus][this.py][this.pz].isLive)     nLiving = nLiving + 1;
    if(cells[this.px][yminus][this.pz].isLive)    nLiving = nLiving + 1;
    if(cells[this.px][yplus][this.pz].isLive)     nLiving = nLiving + 1;
    if(cells[xminus][yminus][this.pz].isLive)     nLiving = nLiving + 1;
    if(cells[xplus][yplus][this.pz].isLive)       nLiving = nLiving + 1;
    if(cells[xplus][yminus][this.pz].isLive)      nLiving = nLiving + 1;
    if(cells[xminus][yplus][this.pz].isLive)      nLiving = nLiving + 1;
    
    
    if(cells[xminus][this.py][zminus].isLive)    nLiving = nLiving + 1;
    if(cells[xplus][this.py][zminus].isLive)     nLiving = nLiving + 1;
    if(cells[this.px][yminus][zminus].isLive)    nLiving = nLiving + 1;
    if(cells[this.px][yplus][zminus].isLive)     nLiving = nLiving + 1;
    if(cells[xminus][yminus][zminus].isLive)     nLiving = nLiving + 1;
    if(cells[xplus][yplus][zminus].isLive)       nLiving = nLiving + 1;
    if(cells[xplus][yminus][zminus].isLive)      nLiving = nLiving + 1;
    if(cells[xminus][yplus][zminus].isLive)      nLiving = nLiving + 1;
    if(cells[this.px][this.py][zminus].isLive)   nLiving = nLiving + 1;
    
    if(cells[xminus][this.py][zplus].isLive)    nLiving = nLiving + 1;
    if(cells[xplus][this.py][zplus].isLive)     nLiving = nLiving + 1;
    if(cells[this.px][yminus][zplus].isLive)    nLiving = nLiving + 1;
    if(cells[this.px][yplus][zplus].isLive)     nLiving = nLiving + 1;
    if(cells[xminus][yminus][zplus].isLive)     nLiving = nLiving + 1;
    if(cells[xplus][yplus][zplus].isLive)       nLiving = nLiving + 1;
    if(cells[xplus][yminus][zplus].isLive)      nLiving = nLiving + 1;
    if(cells[xminus][yplus][zplus].isLive)      nLiving = nLiving + 1;
    if(cells[this.px][this.py][zplus].isLive)   nLiving = nLiving + 1;
      
    fill(color(255,100,100));
    
    
    if(this.isLive)
    {
     //rules for the living 
     if(nLiving < 13)
     {
      this.nextLive = false; 
     }
    else
    {
     //rules for the dead
     this.nextLive = true; 
     }
    }
    else
    {
      if(nLiving >= 14 && nLiving <= 19)
      {
        this.nextLive = true;
      }
      else
      {
        this.nextLive = false;
      }
    }
    //Any live cell with two or three live neighours survivrs.
    //Any dead cell with three live neighbours becomes an alive cell.
    //All other live clels die in the next generation. Similarly, all other dead cells stay dead.
  }
  
}
