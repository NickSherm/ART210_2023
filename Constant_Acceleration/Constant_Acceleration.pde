Mover mover;

void setup() {
  size(800,400);
  mover = new Mover();
  background(255);
}

void draw()
{
 background(255);
 mover.update();
 mover.checkEdges();
 mover.display();
}
