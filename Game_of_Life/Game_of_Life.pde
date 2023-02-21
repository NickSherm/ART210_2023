int cellSize = 10;
int MaxX = 0;
int MaxY = 0;
Cell[][] cells;

int gameState = 0; //state of the game 0 = creating world 1 = running it

void setup()
{
  fullScreen();  
  MaxX = width/cellSize;
  MaxY = height/cellSize;
  cells = new Cell[MaxX][MaxY];
  
  for(int y = 0; y < MaxY; y = y + 1)
    {
      for(int x = 0; x < MaxX; x = x + 1)
        {
          cells[x][y] = new Cell(x,y,cellSize);
        }
    }
}

void draw()
{
 for(int y = 0; y < MaxY; y = y + 1)
 {
  for(int x = 0; x < MaxX; x = x + 1)
  {
    cells[x][y].display();
    cells[x][y].check();
  }
 }
 if(gameState == 1)
 {
 for(int y = 0; y < MaxY; y = y + 1)
 {
  for(int x = 0; x < MaxX; x = x + 1)
  {
    cells[x][y].isLive = cells[x][y].nextLive;
  }
 }
}
}

void mousePressed()
{
  if(gameState == 0)
  {
  int mx = mouseX;
  int my = mouseY;
 for(int y = 0; y < MaxY; y = y + 1)
 {
  for(int x = 0; x < MaxX; x = x + 1)
  {
    cells[x][y].click(mx,my);
  }
 }
 println(mouseX+";"+mouseY); 
}
}

void keyPressed()
{
 if(gameState == 1) 
 {
   gameState = 0;
 }
 else
 {
 gameState = 1;
 }
}
