bodyWidth = 342.9;
bodyBackThickness = 10;
bodyBackHeight = 180;
baseHolsterRadius = 25;
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
$fn = 500;

module MountBody() {
	difference() {
		union() {
			translate([0, bodyWidth, 0]) rotate([90, 0, 0]) linear_extrude(bodyWidth) square([bodyBackThickness, bodyBackHeight + 0]);
			translate([bodyBackThickness + baseHolsterRadius, 0, 0]) rotate([0, -90, -90]) difference() {
				linear_extrude(bodyWidth) circle(baseHolsterRadius + bodyBackThickness);
				translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) circle(baseHolsterRadius);
				translate([0, -baseHolsterRadius - bodyBackThickness, -0.5]) linear_extrude(bodyWidth + 1) square(2 * baseHolsterRadius + 2 * bodyBackThickness + 1);
			}
			translate([bodyBackThickness + topShelfDepth, 0, bodyBackHeight - topShelfVerticalOffset - topShelfThickness]) rotate([0, 0, 90]) linear_extrude(topShelfThickness) square([bodyWidth, topShelfDepth]);
		}
		for(i = [0:accessoryIndentationCount - 1]) {
			translate([bodyBackThickness + topShelfDepth / 2, accessoryTabDiameter / 2 + topShelfHorizontalPadding + (bodyWidth - 2 * topShelfHorizontalPadding - accessoryTabDiameter) * i / (accessoryIndentationCount - 1), bodyBackHeight - topShelfVerticalOffset]) AccessoryIndentation();
		}
	}
}

module AccessoryIndentation() {
	translate([0, 0, -accessoryIndentationDepth / 2 + 0.01]) union() {
		cylinder(h=accessoryIndentationDepth, d1=accessoryIndentationBottomDiameter, d2=accessoryIndentationTopDiameter, center=true);
		translate([-accessoryTabWidth / 2, -accessoryTabDiameter / 2, -accessoryIndentationDepth / 2]) linear_extrude(accessoryIndentationDepth) square([accessoryTabWidth, accessoryTabDiameter]);
		rotate([0, 0, 90]) translate([-accessoryTabWidth / 2, -accessoryTabDiameter / 2, -accessoryIndentationDepth / 2]) linear_extrude(accessoryIndentationDepth) square([accessoryTabWidth, accessoryTabDiameter]);
	}
}

MountBody();
