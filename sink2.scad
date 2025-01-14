use <vacuum-hose-adapter-modules.scad>

outer_radius = 28;
height = 129;
cyl_wall_thickness = 3;
hole_diameter = 4;
hex_walls = 1;

legLength = 25;
legRadius = 2.5;
legTilt = 6;

hole_side = hole_diameter*sin(30);
hole_hspacing = hole_diameter + hole_side + hex_walls;
hole_zspacing = 0.5*(hole_diameter*sin(60) + hex_walls);
hole_layers = floor(height / hole_zspacing);
cyl_circumference = 2*PI*outer_radius;
numholes = floor(cyl_circumference / hole_hspacing);
angle_step = 360/numholes;

difference() {
   // Draw cylinder
   translate([0, 0, legLength-.001])
   cylinder(height, r=outer_radius, $fn=128);

   translate([0,0,legLength-1]) 
      cylinder(height+2, r=outer_radius-cyl_wall_thickness, $fn=128);
   for(zn = [0:hole_layers])
      let(z = zn*hole_zspacing, aoffset = zn%2==0 ? 0 : angle_step/2)
      for(a=[0:angle_step:359.9])
         translate([0,0,z+legLength]) rotate([0,0,a+aoffset]) punch();
}

// ring at bottom to connect to the legs
// ConeRing(centerDiameter, length, wallThickness1, wallThickness2, zPosition)
translate([0,0,legLength])
ConeRing(outer_radius*2, 5, 4, 1, -2, $fn=100);

// ring at top of cylindar
translate([0, 0, legLength+height   ])
ConeRing((outer_radius-1.4)*2, 4, 4, 2, -1, $fn=100);


   color("red")
   // linear_extrude(height = legLength, v = [-legTilt, 0, legLength], center = false, convexity = 10, twist = 0, $fn = 100)
   linear_extrude(height = legLength, scale=[1,3],  v = [-legTilt, 0, legLength], center = false, convexity = 10, twist = 0, $fn = 100)
   translate([outer_radius+legTilt, 0, 0])
   circle(r = legRadius);

color("green")
linear_extrude(height = legLength,  scale=[1,3], v=[legTilt, 0, legLength], center = false, convexity = 10, twist = 0, $fn = 100)
   translate([-outer_radius-legTilt, 0, 0])
   circle(r = legRadius);

color("blue")
linear_extrude(height = legLength, scale=[3,1], v=[0, -legTilt, legLength], center = false, convexity = 10, twist = 0, $fn = 100)
   translate([0, outer_radius+legTilt, 0])
   circle(r = legRadius);

color("white")
linear_extrude(height = legLength, scale=[3,1], v=[0, legTilt, legLength], center = false, convexity = 10, twist = 0, $fn = 100)
   translate([0, -outer_radius-legTilt, 0])
   circle(r = legRadius);

// This module is where the hex holes are generated
module punch() {
   rotate([0,90,0]) rotate([0,0,90])
      cylinder(outer_radius+1, d1=0, d2=hole_diameter, $fn=6);
}

