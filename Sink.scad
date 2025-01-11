use <vacuum-hose-adapter-modules.scad>

$fn=400;
legX = 8;
legY = 3;
legZ = 50;

offsetX = 40;
offsetY = 20;
offsetZ = 0;
module end_of_customizer_opts() {}

difference() {
   color("blue")
   cube([legX, legY, legZ] );
   //cube([30, 30, 4]);
}

translate([offsetX, offsetY, offsetZ]) {
   color("red")
   cube([legX, legY, legZ] );
}

translate([0, offsetY, offsetZ]) {
   color("green")
   cube([legX, legY, legZ] );
}

translate([offsetX, 0, offsetZ]) {
   color("gray")
   cube([legX, legY, legZ] );
}

translate([0, 0, legZ]) {
   color("yellow")
   cube([legY, offsetY+legY, legY]);
   cube([offsetX+legX,legY, legY]);
}

translate([offsetX+legX-legY, 0, legZ]) {
   color("tan") cube([legY, offsetY+legY, legY]);
}

translate([0, offsetY, legZ]) {
   color("orange")
   cube([offsetX+legX, legY, legY]);
}

// StraightPipe(
//    diameter = 30,
//    length = 100,
//    wallThickness = 2.5,
//    zPosition=0
// );

// TaperedBentPipe(
//    bendRadius=10,
//    end1InnerPipeDiameter = 40,
//    end2InnerPipeDiameter = 45,
//    end1WallThickness=3,
//    end2WallThickness=4,
//    pipeAngle=90,
//    zPosition = 0,
//    baseType="none",
//    baseWidth=0,
//    baseLength=0,
//    baseThickness=0,
//    baseAngle=0,
//    end2Count=1
// );

Nozzle(
 innerStartDiameter=50,
  length=50,
  wallThickness=3,
  nozzleShape="circle",
  nozzleSquareWidth=5,
  nozzleSquareDepth=5,
  nozzleTipWallThickness=1,
  nozzleRadius=20,
  nozzleLength=30,
  nozzlexOffset = 0,
  nozzleyOffset = 0,
  nozzleChamferPercentage = 0,
  nozzleChamferAngle = 0
);
