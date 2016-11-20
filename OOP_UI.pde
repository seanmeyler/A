
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
  basic_shape();
  radar_tool();
}

void basic_shape()
{
   fill(96, 96, 96);
   noStroke();
   rect(0, height - 75, width, 100);
   
   fill(96, 96, 96);
   noStroke();
   triangle(0 , 0, 0, 200, 200, 0); 
   triangle(1150, 0, width - 200, 0, 1150, 200);
   triangle(0, height, 0, height - 200, 200, height);
   triangle(width, height, width, height - 200, width - 200, height);
   
   stroke(20, 20, 20);
   strokeWeight(8);
   line(0, height - 75, width, height - 75);
   strokeWeight(12);
   line(200, 0, 0, 200);
   line(width - 200, 0, width, 200);
   line(0, height - 200, 122, height - 77);
   line(width, height - 200,  width - 120, height - 78);
}

void radar_tool()
{
   fill(0);
   stroke(40, 40, 40);
   strokeWeight(10);
   ellipse(187, 167, 250, 250);
}