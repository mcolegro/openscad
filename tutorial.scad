$fa = 1;
$fs = 0.4;

wheelRadius = 6;
axleRadius = 1;

// car body
cube([60,20,10], center=true);

// car top
translate([0, 0, 10-.001])
cube([30,20,10], center=true);

// front left wheel
translate([-20, -15, 0])
rotate([90,0,20])
cylinder(h=3, r=wheelRadius, center=true);

translate([-20, 15, 0])
rotate([90,0,20])
cylinder(h=3, r=wheelRadius, center=true);

translate([20, -15, 0])
rotate([90,0,0])
cylinder(h=3, r=wheelRadius, center=true);

translate([20, 15, 0])
rotate([90,0,0])
cylinder(h=3, r=wheelRadius, center=true);

// front axle
translate([20, 0, 0])
rotate([90, 0, 0])
cylinder(h=30, r=axleRadius, center=true);

// rear axle
translate([-20, 0, 0])
rotate([90, 0, 0])
cylinder(h=30, r=axleRadius, center=true);
