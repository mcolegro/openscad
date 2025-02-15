use <vacuum-hose-adapter-modules.scad>

// all units are millimeters
neckOD = 152;
neckWallThickness = 2;
neckID = neckOD - neckWallThickness * 2;
neckHeight = 30;
flangeThickness = 2;
neckRadius = neckID / 2;

$fn = 130;

StraightPipe(
   neckID, 
   neckHeight, 
   neckWallThickness, 
   0
);

// plate
color("yellow")
difference() {
   translate([0, 0, flangeThickness/2])
   cube([neckOD+40, neckOD+40, flangeThickness], center=true);
   cylinder(flangeThickness, r=neckRadius);
}

echo( neckID = neckID, neckRadius = neckRadius);