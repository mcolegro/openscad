use <vacuum-hose-adapter-modules.scad>

$fn=120;
$fs = 1;
$fa = 6;

part = "mag100tohose93"; 

module end_of_customizer_opts() {}

// Mag to 4" hose
if (part == "mag100tohose100") {
    HoseAdapter(
        drawAlignmentRing = "no",
        alignmentDepth = 2,
        alignmentUpperWidth = 3,
        alignmentLowerWidth = 0.5,
        alignmentSideClearance = 0.25,
        alignmentDepthClearance = 0.75,
        connector1Style = "mag",
        connector1Measurement = "inner",
        connector1Diameter = 100,
        connector1Length = 15,
        connector1MagnetCount = 12,
        connector1MagnetDiameter = 12,
        connector1MagnetThickness = 3,
        connector1MagnetBorder = 3,
        connector1MagnetFlangeThickness = 7,
        connector1Ring = "recessed",
        transitionStyle = "bend+taper",
        transitionLength = 10,
        connector2Style = "hose",
        connector2Measurement = "outer",
        connector2Diameter = 100,
        connector2Length = 40,
        connector2Taper = 2,
        connector2WallThickness = 3,
        connector2Ring = "no");
}

// mag connector to 93mm hose for blue hose
if (part == "mag100tohose93") {
    HoseAdapter(
        drawAlignmentRing = "no",
        alignmentDepth = 2,
        alignmentUpperWidth = 3,
        alignmentLowerWidth = 0.5,
        alignmentSideClearance = 0.25,
        alignmentDepthClearance = 0.75,
        connector1Style = "mag",
        connector1Measurement = "inner",
        connector1Diameter = 100,
        connector1Length = 15,
        connector1MagnetCount = 12,
        connector1MagnetDiameter = 12,
        connector1MagnetThickness = 3,
        connector1MagnetBorder = 3,
        connector1MagnetFlangeThickness = 7,
        connector1Ring = "recessed",
        transitionStyle = "bend+taper",
        transitionLength = 10,
        connector2Style = "hose",
        connector2Measurement = "outer",
        connector2Diameter = 93,
        connector2Length = 40,
        connector2Taper = 2,
        connector2WallThickness = 3,
        connector2Ring = "no");
}

// Mag to 2 1/4 hose
if (part == "mag100tohose58") {
    HoseAdapter(
        drawAlignmentRing = "no",
        alignmentDepth = 2,
        alignmentUpperWidth = 3,
        alignmentLowerWidth = 0.5,
        alignmentSideClearance = 0.25,
        alignmentDepthClearance = 0.75,
        connector1Style = "mag",
        connector1Measurement = "inner",
        connector1Diameter = 100,
        connector1Length = 15,
        connector1MagnetCount = 12,
        connector1MagnetDiameter = 12,
        connector1MagnetThickness = 3,
        connector1MagnetBorder = 3,
        connector1MagnetFlangeThickness = 7,
        connector1Ring = "recessed",
        transitionStyle = "bend+taper",
        transitionLength = 25,
        connector2Style = "hose",
        connector2Measurement = "outer",
        connector2Diameter = 58.65,
        connector2Length = 40,
        connector2Taper = 2,
        connector2WallThickness = 2.5,
        connector2Ring = "no");
}

// 4" hose to 2 1/4 fitting i.e. tablesaw or sander
if (part == "tablesaw") {
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
}

if (part == "4in_pipe") {
      HoseAdapter(
      connector1Style = "hose",
      connector1Measurement = "outer",
      connector1Diameter = 100,
      connector1Length = 30,
      connector1StopThickness = 4,
      connector1StopLength = 8,
      connector1WallThickness = 3,
      transitionStyle = "bend+taper",
      transitionLength = 5,
      connector2Style = "hose",
      connector2Measurement = "outer",
      connector2Diameter = 100,
      connector2WallThickness = 2.5,
      connector2Length = 30,
      connector2Taper = 2
      );
}