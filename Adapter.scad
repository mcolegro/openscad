include <vacuum-hose-adapter-modules.scad>

$fn = 300;
flangeLength = 40;
transitionLength = 25;

//OD1 = 4;
//ID1 = 3.9;

//OD2 = 2.25;
//ID2 = 2.15;

OD1 = 101.6;
ID1 = 99.6;

OD2 = 57.15;
ID2 = 55.15;

wallThickness = 3;

union(){

StraightPipe(OD1, flangeLength, wallThickness);
translate([0,0,flangeLength]) {
   Pipe(OD1, OD2, transitionLength, wallThickness, wallThickness, 0, 0, 0);
}
translate([0,0,flangeLength+transitionLength])
   StraightPipe(OD2, flangeLength, wallThickness);
}

// color("yellow")
// difference(){
//    cylinder(h=flangeLength,d=OD1);
//    cylinder(h=flangeLength,d=ID1);
// }
// translate([0,0,flangeLength]){
//    color("green")
//    difference() {
//       cylinder(h=transitionLength,d1=OD1,d2=OD2);
//       cylinder(h=transitionLength,d1=ID1,d2=ID2);
//    }
// }

// translate([0,0,flangeLength+transitionLength])
// {
//    color("cyan")
//    difference() {
//       cylinder(h=flangeLength,d=OD2);
//       cylinder(h=flangeLength,d=ID2);
//    }
// }
