// Lines that begin with // are comments 
// This "use" command means to read in the file with the following name.  The file should be in the same folder as your models
use <vacuum-hose-adapter-modules.scad>

//  These are parameters and all you have to do is declare the parameter and assign a value to it.  What you call the parameter
//  is up to you, but it's better not to use a OpenSCAD keyword.  I'm pretty sure the names are case sensitive.
topDiameter = 77;
bottomDiameter = 60;
height = 85;
wallThickness = .87;

topRadius = topDiameter / 2;
botRadius = bottomDiameter / 2;

// $fn is a special parameter.  I forgot was it's for, but you can look it up
$fn = 130;


// I use colors to help visualize different shapes
color("yellow")
// difference is an OpenSCAD command.  It draws the first item and removes all the remaining child items.  The { } brackets are
// used to group all the child elements that are part of the difference operation.
difference() {
   // Outside cylinder
   cylinder(h=height, r1=botRadius, r2=topRadius, center = false);

   // remove inside cylinder
   // translate is an OpenSCAD command that effectively moved the origin for drawing the next object.
   translate([0, 0, wallThickness])
   cylinder(height, r1=(botRadius  - wallThickness), r2=(topRadius-wallThickness ), center=false);

   // remove drain holes
   cylinder(h=10, r1=3, center = false);

   translate([botRadius/2, 0, 0])
   cylinder(h=10, r1=3, center = false);

   translate([-botRadius/2, 0, 0])
   cylinder(h=10, r1=3, center = false);

   translate([ 0, botRadius/2, 0])
   cylinder(h=10, r1=3, center = false);

   translate([ 0, -botRadius/2, 0])
   cylinder(h=10, r1=3, center = false);

};

// ring at top of cylindar
// ConeRing is a module in the hose adapter file.  You can look at the code in the other file to see what parameters are being passed
color("green")
ConeRing((topDiameter), 1, 1, 1, height-1, $fn=100);

// One last detail about the code.  The ; (semi-colon) marks the end of a command.  Some command, like translate and rotate, operate
// on the command that follows that command.  For those cases, those commands do not end with a semi-colon.  You can see that above
// with the color command and the translate command.