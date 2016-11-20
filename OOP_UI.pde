
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
  pulsating_lines();
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
   int rad_width = 15;
   fill(0);
   stroke(40, 40, 40);
   strokeWeight(10);
   ellipse(187, 167, 250, 250);
   
   for(int i = 1; i < 16; i++)
   {
     stroke(0, 255, 255);
     strokeWeight(0.3);
     noFill();
     ellipse(187, 167, rad_width, rad_width);
     rad_width += 15;
   } 
}

void pulsating_lines()
{
   //TOP LEFT
   line(10, 10, 10, 165);
   line(13, 10, 165, 10);
   //BOTTOM RIGHT
   line(width - 10, height - 90, width - 10, height - 165);
   line(width - 10, height - 90, width - 90, height - 90);
   //TOP RIGHT
   line(width - 7, 10, width - 10, 165);
   line(width - 10, 10, width - 165, 10);
   //BOTTOM LEFT
   line(10, height - 90, 10, height - 165);
   line(13, height - 90, 90, height - 90); 
}