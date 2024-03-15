include <Shared.scad>;

notchDiameter = 42;
smallNotchWidth = 4.5;
largeNotchWidth = 6;
indentationBottomDiameter = 36;
indentationTopDiameter = 40;

function calculateIndentationCenter(index) = [bodyBackThickness + topShelfDepth / 2, notchDiameter / 2 + topShelfHorizontalPadding + (frontWidth - 2 * topShelfHorizontalPadding - notchDiameter) * index / 3, bodyBackHeight - topShelfVerticalOffset];


module AccessoryIndentation(notch=true) {
	translate([0, 0, -indentationDepth / 2 + 0.01]) union() {
		bottomDiameter = notch ? indentationBottomDiameter : notchDiameter;
		topDiameter = notch ? indentationTopDiameter : notchDiameter;
		cylinder(h=indentationDepth, d1=bottomDiameter, d2=topDiameter, center=true);
		if (notch) {
			translate([-largeNotchWidth / 2, -notchDiameter / 2, -indentationDepth / 2]) linear_extrude(indentationDepth) square([largeNotchWidth, notchDiameter]);
			rotate([0, 0, 90]) translate([-smallNotchWidth / 2, -notchDiameter / 2, -indentationDepth / 2]) linear_extrude(indentationDepth) square([smallNotchWidth, notchDiameter]);
		}
	}
}
