use <vacuum-hose-adapter-modules.scad>

topDiameter = 75;
bottomDiameter = 60;
height = 85;
wallThickness = 1;

topRadius = topDiameter / 2;
botRadius = bottomDiameter / 2;

$fn = 130;

// StraightPipe(
//    topDiameter, 
//    height, 
//    wallThickness, 
//    0
// );

// plate
color("yellow")
difference() {
   cylinder(h=height, r1=botRadius, r2=topRadius, center = false);

   translate([0, 0, wallThickness])
   cylinder(height, r1=(botRadius  - wallThickness), r2=(topRadius-wallThickness ), center=false);

   cylinder(h=10, r1=3, center = false);
};

// echo( neckID = neckID, neckRadius = neckRadius);