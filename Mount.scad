bodyWidth = 342.9;
bodyBackThickness = 10;
bodyBackHeight = 180;
baseHolsterRadius = 25;
baseHolsterLipLength = 25;
topShelfVerticalOffset = 25;
topShelfDepth = 65;
topShelfThickness = 15;
topShelfHorizontalPadding = 25;
accessoryIndentationDepth = 7;
accessoryTabDiameter = 42;
accessoryTabWidth = 4.5;
accessoryIndentationBottomDiameter = 36;
accessoryIndentationTopDiameter = 40;
accessoryIndentationCount = 4;
smoothingBrushInnerTopHeight = 52;
smoothingBrushInnerTopHorizontalOffset = 2;
smoothingBrushInnerBottomHeight = 26;
smoothingBrushInnerBottomHorizontalOffset = 7;
smoothingBrushInnerDiameter = 31;
$fn = 500;

function calculateIndentationCenter(index) = [bodyBackThickness + topShelfDepth / 2, accessoryTabDiameter / 2 + topShelfHorizontalPadding + (bodyWidth - 2 * topShelfHorizontalPadding - accessoryTabDiameter) * index / (accessoryIndentationCount - 1), bodyBackHeight - topShelfVerticalOffset];

module MountBody() {
	union() {
		difference() {
			union() {
				translate([0, bodyWidth, 0]) rotate([90, 0, 0]) linear_extrude(bodyWidth) square([bodyBackThickness, bodyBackHeight + 0]);
				translate([bodyBackThickness + baseHolsterRadius, 0, 0]) rotate([0, -90, -90]) union() {
					outerCircleRadius = baseHolsterRadius + bodyBackThickness;
					difference() {
						linear_extrude(bodyWidth) circle(outerCircleRadius);
						translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) circle(baseHolsterRadius);
						translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) polygon([[outerCircleRadius + 1, outerCircleRadius + 1], [-outerCircleRadius - 1, outerCircleRadius + 1], [-outerCircleRadius, outerCircleRadius], [0, 0], [0, -outerCircleRadius - 1], [outerCircleRadius + 1, -outerCircleRadius - 1 ]]);
					}
					translate([-outerCircleRadius * sin(45), outerCircleRadius * sin(45), 0]) rotate([0, 0, -45]) linear_extrude(bodyWidth) square([bodyBackThickness, baseHolsterLipLength]);
				}
				translate([bodyBackThickness + topShelfDepth, 0, bodyBackHeight - topShelfVerticalOffset - topShelfThickness]) rotate([0, 0, 90]) linear_extrude(topShelfThickness) square([bodyWidth, topShelfDepth]);
			}
			for(i = [0:accessoryIndentationCount - 1]) {
				translate(calculateIndentationCenter(i)) AccessoryIndentation();
			}
			translate([bodyBackThickness + topShelfDepth + 0.99, bodyWidth / 8, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([0, -90, 0]) linear_extrude(1) scale((topShelfThickness - 8) / 118) SmoothingBrushIcon();
		}
		translate([0, 0, -accessoryIndentationDepth - 0.01]) translate(calculateIndentationCenter(0)) SmoothingBrushSupportBeam();
	}
}

module AccessoryIndentation() {
	translate([0, 0, -accessoryIndentationDepth / 2 + 0.01]) union() {
		cylinder(h=accessoryIndentationDepth, d1=accessoryIndentationBottomDiameter, d2=accessoryIndentationTopDiameter, center=true);
		translate([-accessoryTabWidth / 2, -accessoryTabDiameter / 2, -accessoryIndentationDepth / 2]) linear_extrude(accessoryIndentationDepth) square([accessoryTabWidth, accessoryTabDiameter]);
		rotate([0, 0, 90]) translate([-accessoryTabWidth / 2, -accessoryTabDiameter / 2, -accessoryIndentationDepth / 2]) linear_extrude(accessoryIndentationDepth) square([accessoryTabWidth, accessoryTabDiameter]);
	}
}

module SmoothingBrushIcon() {
	difference() {
		offset(10) square([118, 64]);
		square([118, 64]);
	}
	for(i = [0:3]) {
		for(j = [0:5]) {
			translate([j * 432 / 23 + 12, i * 81 / 6 + 12, 0]) circle(3, $fn=25);
		}
	}
}

module SmoothingBrushSupportBeam() {
	intersection() {
		cylinder(smoothingBrushInnerTopHeight, d=smoothingBrushInnerDiameter);
		translate([-smoothingBrushInnerDiameter / 2, smoothingBrushInnerDiameter / 2, 0]) rotate([90, 0, 0]) linear_extrude(smoothingBrushInnerDiameter + 1) polygon([[0, 0], [0, smoothingBrushInnerTopHeight], [smoothingBrushInnerTopHorizontalOffset, smoothingBrushInnerTopHeight], [smoothingBrushInnerDiameter - smoothingBrushInnerBottomHorizontalOffset, smoothingBrushInnerBottomHeight], [smoothingBrushInnerDiameter, smoothingBrushInnerBottomHeight], [smoothingBrushInnerDiameter, 0]]);
	}
}
MountBody();
