PFont font;
float rad_speed = 4.0f;
float rad_speed2 = 1.0f;
float line_x = 67;
float line_y1 = 167f;
float line_y2 = 167f;
float transparency;
float trans;
float inc;
float Xpos;
float Ypos;
float angle = 90;
int load_width = 0;
float fuel_width = 100;
int fuel_num = 100;
int speed_height = 695;
float speed_width = 140;
int sys1 = 0;
int engine_status = 0;
int circleSize = 40;
int MAXCIRCLES = 100; 
int[] a = new int[MAXCIRCLES]; 
int circles = 1;
int missileleft_x = 50;
int missileright_x = 1100;
int missileleft_y = 750;
int missileright_y = 750;
int missileon = 0;
radar_circle[] myCircle;
boolean overCircle1 = false;
boolean overCircle2 = false;
boolean overCircle3 = false;


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
  
  //For Fonts
  font = createFont("AR DESTINE", 60);
  textFont(font);
  
  //For pulsating colors
  transparency = 1;
  trans = -0.01;
  
  frameRate(60); 
  smooth();
  stroke(0, 255, 255);
  strokeWeight(1); 
   myCircle = new radar_circle[MAXCIRCLES]; 
  // Initial radar_circle
   myCircle[0]  = new radar_circle(187, 167);
  
  //Wanted a differenct curson rather than a mouse pointer for a more SciFi look
  cursor(CROSS); 
}

void draw()
{
  basic_shape();
  radar_tool();
  system_display();
  pulsating_lines();
  speed_display();
  weapons_system();
  mouseOver();
  
   stroke(0, 255, 255);
   strokeWeight(1); 
   noFill(); 
   for(int current = 0; current < circles; current++)
   { 
     myCircle[current].update();
   }
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
   float a = map(transparency, 0, 1, 0, 255);
   stroke(0, 255, 255, a);
   strokeWeight(3);
   transparency += trans;
   
   //If statements to control the pulsating colors
   if (transparency < 0) 
   {
      trans = - trans;
   } 
   else if (transparency > 1)
   {
      trans = - trans;
   }
   
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

void system_display()
{  
   if(sys1 == 0)
   {
     fill(0);
     stroke(40, 40, 40);
     strokeWeight(10);
     rect(425, height - 250, 300, 175, 15);
     //System Loading Display
     noFill();
     strokeWeight(1);
     rect(475, height - 150, 200, 10);
     fill(0, 153, 153);
     noStroke();
     rect(475, height - 150, load_width, 10);
     textSize(20);
     text("SYSTEM LOADING...", 485, height - 170);
     if(load_width <= 200)
     {
       load_width++;
     }
     if(load_width == 200)
     {
       sys1 = 1;
       fill(0);
       rect(425, height - 250, 300, 175, 15);
       fill(0, 153, 153);
       textSize(30);
       text("SYSTEM ONLINE:", 460, height - 160);
     }
   }
}

void speed_display()
{
   fill(0);
   stroke(40, 40, 40);
   strokeWeight(4);
   rect(120, height - 220, 200, 150, 15);
   rect(75, height - 63, 385, 60, 15);
   stroke(43, 131, 161);
   strokeWeight(1);
   line(123, height  - 145, 317, height - 145);
   line(207, height  - 60, 207, height - 6);
   line(333, height  - 60, 333, height - 6);
   fill(0, 153, 153);
   textSize(16);
   text("SPEED:", 130, height - 200);
   textSize(16);
   text("ENERGY:", 130, height - 125);
   fill(0, 220, 260);
   if(engine_status == 0)
   {
     fill(0, 153, 153);
     textSize(12);
     text("ENGINE STATUS:", 90, height - 50);
     textSize(20);
     text("1: INACTIVE", 90, height - 25);
     textSize(20);
     text("2: INACTIVE", 215, height - 25);
     textSize(20);
     text("3: INACTIVE", 340, height - 25);
   }
   else
   {
     fill(0);
     stroke(40, 40, 40);
     strokeWeight(4);
     rect(75, height - 63, 385, 60, 15);
     fill(0, 153, 153);
     stroke(43, 131, 161);
     strokeWeight(1);
     line(123, height  - 145, 317, height - 145);
     line(207, height  - 60, 207, height - 6);
     line(333, height  - 60, 333, height - 6);
     textSize(12);
     text("ENGINE STATUS:", 90, height - 50);
     textSize(20);
     text("1: ACTIVE", 90, height - 25);
     textSize(20);
     text("2: ACTIVE", 215, height - 25);
     textSize(20);
     text("3: ACTIVE", 340, height - 25); 
   }
   
   fill(0);
   stroke(0, 153, 153);
   strokeWeight(1);
   rect(130, height - 110, 100, 15);
   fill(0, 153, 153);
   noStroke();
   rect(130, height - 110, fuel_width, 15);
   fill(0, 153, 153);
   textSize(30);
   text(fuel_num, 245, height - 93); 
   textSize(24);
   text("%", 295, height - 97);
   
   fill(0);
   stroke(0, 153, 153);
   triangle(135, height - 155, 300, height - 205, 300, height - 155);
   fill(0, 153, 153);
   triangle(135, height - 155, speed_width, speed_height, speed_width, height - 155);
}

void weapons_system()
{
   fill(0);
   stroke(50, 50, 50);
   strokeWeight(6);
   rect(width - 93, 175, 90, 500, 15);
   fill(0, 153, 153);
   textSize(15);
   text("WEAPONS", width - 80, 200);
   text("SYSTEM", width - 75, 215);
   text("ONLINE:", width - 72, 230);
   text("LASER", width - 72, 260);
   text("BEAM:", width - 72, 275);
   text("PULSE", width - 72, 400);
   text("RIFLES:", width - 75, 415);
   text("BLASTER", width - 77, 550);
   text("CANNON:", width - 75, 565);
   stroke(0, 153, 153);
   strokeWeight(1);
   line(width - 89, 240, width - 7, 240);
   line(width - 89, 380, width - 7, 380);
   line(width - 89, 530, width - 7, 530);
}

void mouseOver()
{
   fill(10, 10, 10);
   stroke(40, 40, 40);
   strokeWeight(2);
   ellipse(width - 47, 325, circleSize, circleSize);
   ellipse(width - 47, 465, circleSize, circleSize);
   ellipse(width - 47, 615, circleSize, circleSize);
  
  //BUTTON 1
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 325 - circleSize && mouseY < 325 + circleSize)
  {
    overCircle1 = true;  
    if(overCircle1) 
    { 
      
      stroke(40, 40, 40);
      strokeWeight(2);
      float a = map(transparency, 0, 1, 0, 255);
      fill(0, 153, 153, a);
      transparency += trans;
       
      //If statements to control the pulsating colors
      if (transparency < 0) 
      {
        trans = - trans;
      } 
      else if (transparency > 1)
      {
         trans = - trans;
      }
      ellipse(width - 47, 325, circleSize, circleSize);
      
      if(mousePressed)
      {
         fill(0, 153, 153);
         ellipse(width - 47, 325, circleSize, circleSize);
         overCircle1 = false;
      }
   } 
  }
  else 
  {
    fill(10,10,10);
    stroke(40, 40, 40);
    strokeWeight(2);
    overCircle1 = false;
  }
  ellipse(width - 47, width - 47, circleSize, circleSize);
  
  //BUTTON 2
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 465 - circleSize && mouseY < 465 + circleSize)
  {
    overCircle2 = true;  
    if(overCircle2) 
    { 
      
      stroke(40, 40, 40);
      strokeWeight(2);
      float a = map(transparency, 0, 1, 0, 255);
      fill(0, 153, 153, a);
      transparency += trans;
       
      //If statements to control the pulsating colors
      if (transparency < 0) 
      {
        trans = - trans;
      } 
      else if (transparency > 1)
      {
         trans = - trans;
      }
      ellipse(width - 47, 465, circleSize, circleSize);
      
      if(mousePressed)
      {
         fill(0, 153, 153);
         ellipse(width - 47, 465, circleSize, circleSize);
         overCircle1 = false;
      }
    } 
   }
  else 
  {
    fill(10,10,10);
    stroke(40, 40, 40);
    strokeWeight(2);
    overCircle2 = false;
  }
  ellipse(width - 47, width - 47, circleSize, circleSize);
  
  //BUTTON 3
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 615 - circleSize && mouseY < 615 + circleSize)
  {
    overCircle3 = true;  
    if(overCircle3) 
    { 
      
      stroke(40, 40, 40);
      strokeWeight(2);
      float a = map(transparency, 0, 1, 0, 255);
      fill(0, 153, 153, a);
      transparency += trans;
       
      //If statements to control the pulsating colors
      if (transparency < 0) 
      {
        trans = - trans;
      } 
      else if (transparency > 1)
      {
         trans = - trans;
      }
      ellipse(width - 47, 615, circleSize, circleSize);
      
      if(mousePressed)
      {
         fill(0, 153, 153);
         ellipse(width - 47, 615, circleSize, circleSize);
         overCircle1 = false;
      }
    } 
  }
  else 
  {
    fill(10,10,10);
    stroke(40, 40, 40);
    strokeWeight(2);
    overCircle3 = false;
  }
  ellipse(width - 47, width - 47, circleSize, circleSize);
}

class radar_circle
{
  float radius, xpos = 187, ypos = 167; 
  radar_circle (float x, float y) 
  { 
    radius = 0; 
    xpos = x; 
    ypos = y; 
  } 
  void update()
  { 
     stroke(0, 255, 255);
     strokeWeight(1); 
     radius++; 
     if (radius > 230)
     {
       radius = 0; 
     }
     ellipse(xpos,ypos, radius,radius); 
  } 
}

void keyPressed()
{
  if(key == 'p')
  {
    engine_status = 1;
    
    if(fuel_width >= 0)
    {
       fuel_width--;
       fuel_num--;
    }
    
    if(speed_width <= 300)
    {
       speed_height--; 
       speed_width = speed_width + 3.2;
    }
  }
  
  if(key == 'o')
  {
     engine_status = 0; 
    
    if(fuel_width <= 0)
    {
       fuel_width++;
    }
    
    if(speed_width <= 210 || fuel_num != 100)
    {
       fuel_num++; 
       fuel_width++;
    }
    if(speed_width >= 130)
    {
       speed_height++; 
       speed_width = speed_width - 3.2;
    }
  }
  
  if(key == 'r')
  {
     if (circles < MAXCIRCLES) 
     {
       stroke(0, 255, 255);
       strokeWeight(1); 
       myCircle[circles]  = new radar_circle(187, 167); 
       circles = circles + 1; 
     }
  }
  
  if(key == 'e')
  {
    circles = circles - 1; 
  }
}


void mousePressed()
{
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 325 - circleSize && mouseY < 325 + circleSize && mousePressed)
  {
    fill(0, 153, 153);
    ellipse(width - 47, width - 47, circleSize, circleSize);
    overCircle1 = false;
  } 
  
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 465 - circleSize && mouseY < 465 + circleSize && mousePressed)
  {
    fill(0, 153, 153);
    ellipse(width - 47, width - 47, circleSize, circleSize);
    overCircle1 = false;
  } 
  
  if (mouseX > width - 47 - circleSize && mouseX < width - 47 + circleSize && mouseY > 615 - circleSize && mouseY < 615 + circleSize && mousePressed)
  {
    fill(0, 153, 153);
    ellipse(width - 47, width - 47, circleSize, circleSize);
    overCircle1 = false;
  }
}

void missile1()
{
   if(missileon == 1)
   {
     noStroke();
     fill(255, 0 , 0);
     triangle(missileleft_x, missileleft_y, mouseX, mouseY, mouseX + 10, mouseY);
     triangle(missileright_x, missileright_y, mouseX, mouseY, mouseX + 10, mouseY);
   }
   else
   {
     noStroke();
     fill(0);
     triangle(missileleft_x, missileleft_y, mouseX, mouseY, mouseX + 10, mouseY);
     triangle(missileright_x, missileright_y, mouseX, mouseY, mouseX + 10, mouseY); 
   }
}