# Obeject Oriented Programming Assignment-C15431532-Seán Meyler

Demo Youtube Link: [![Video](http://img.youtube.com/vi/4buVASRwllg/0.jpg)](http://www.youtube.com/watch?v=4buVASRwllg)

Libraries used: Minim - http://code.compartmental.net/tools/minim/

For my assignment I created a spaceship cockpit UI, in the theme "SciFi UI". I aimed to use a grey and blue color scheme as I thought it
created the optimal look for my UI.

I start of my sketh by imported the Minim library so that I could incorporate sound into my sketch.
In my setup I start off by making my sketch 1150x850, and loading in a background image of a nebula like color scheme. I aimed to use an 
image with no stars so that I could create my own stars over my picture. I used a for loop to generate random stars dotted around my
sketch.
I then decided to use a more SciFi looking font as the default font did not suit the look of my UI. I settled on "AR DESTINE" as my font type.
I defined my variables transparency and trans in my setup and set their values.
Then I passed the values for my radar class into my sketch.
As I did not like the default cursor I used the built in cross radar cursor. Finally I loaded in my 4 sound files which I used throughout my
sketch.

In my draw function I excecuted all my fuctions in the order I wanted them drawn for the correct overlay. And created my increasing radar.

lines():

This was a simples function in which I drew a few colored lines to make the overall look of my UI more pretty.

basic_shape():

This fuction draws out the basic shape of my UI which is a combination of rectangles and triangles. It creates an outline for the whole sketch
to be drawn on top of.

radar_tool():

This function draws the basic shape of the radar tool using various ellipses and a for loop which draws various non filled elippses at 
different sizes to create a radar look.
If the key "R" is pressed the radar creates new circles which gives the effect of an operational radar, if the key "E" is pressed the
opposite happens. This is done incrementing and decrementing the variable circles which creates and deletes expanding circles from the
radar. Radar sounds are also played using the minim library if these keys are pressed.

pulsating_lines():

This fuction changes the alpha of my colors to give a pulsating effect by incrementing and decrementing the variable trans.
I then again create some lines to give the UI an over prettier look.

system_display():

On the bottom middle of my sketch is a loading display which is displayed when the sketch is run. I use two if statements to control
loading bar increasing and to control the "system online" display.

speed_display():

This fuction creates engine active and inactive signs on the bottom left of the sketch and as well creates a speed display and energy
level display.
If the key "P" is pressed the speed display increases and the energy levels drain using for loops and if statements, if the key "O"
is pressed the opposite happens.
Increasing and decreasing/alert sounds are also played when these buttons are pressed.

weapons_system():

This function simply creates a weapon system which displays a system of weapons that general SciFi spaceships has that the pilot of the 
ship would have a selection to.

mouseOver():

If the mouse hovers over the weapons system buttons they glow. This is achieved by again changing the alpha of the colors to create a 
transparent pulsating effect.

mousePressed():

Used for giving the effect of a selected weapon in the weapons system display.

