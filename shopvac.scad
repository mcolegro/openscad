include <vacuum-hose-adapter-modules.scad>

fudgeFactor = 0.015;
$fn=120;

   HoseAdapter(
      connector1Style = "hose",
      connector1Measurement = "outer",
      connector1Diameter = 101.6,
      connector1Length = 40,
      connector1StopThickness = 4,
      connector1StopLength = 8,
      connector1WallThickness = 3,
      transitionStyle = "bend+taper",
      transitionLength = 25,
      connector2Style = "hose",
      connector2Measurement = "outer",
      connector2Diameter = 58.65,
      connector2WallThickness = 2.5,
      connector2Length = 40,
      connector2Taper = 2
      );

