
void setup()
{
  size(1150,850);
  background(0);
  
  //Create Space Background of randomly generated stars
  for(int i = 0; i < 3000; i++)
  {
    fill(255);
    noStroke();
    ellipse(random(0, 1150), random(0, 850), random(0, 5), random(0 , 5)); 
  }
}

void draw()
{
}