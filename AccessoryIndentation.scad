include <Shared.scad>;

tabDiameter = 42;
tabWidth = 4.5;
indentationBottomDiameter = 36;
indentationTopDiameter = 40;

function calculateIndentationCenter(index) = [bodyBackThickness + topShelfDepth / 2, tabDiameter / 2 + topShelfHorizontalPadding + (bodyWidth - 2 * topShelfHorizontalPadding - tabDiameter) * index / 3, bodyBackHeight - topShelfVerticalOffset];


module AccessoryIndentation(notch=true) {
	translate([0, 0, -indentationDepth / 2 + 0.01]) union() {
		bottomDiameter = notch ? indentationBottomDiameter : tabDiameter;
		topDiameter = notch ? indentationTopDiameter : tabDiameter;
		cylinder(h=indentationDepth, d1=bottomDiameter, d2=topDiameter, center=true);
		if (notch) {
			translate([-tabWidth / 2, -tabDiameter / 2, -indentationDepth / 2]) linear_extrude(indentationDepth) square([tabWidth, tabDiameter]);
			rotate([0, 0, 90]) translate([-tabWidth / 2, -tabDiameter / 2, -indentationDepth / 2]) linear_extrude(indentationDepth) square([tabWidth, tabDiameter]);
		}
	}
}
