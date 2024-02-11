bodyWidth = 342.9;
bodyBackThickness = 7.5;
bodyBackHeight = 180;
baseHolsterRadius = 25; // TODO: Double-check
topShelfVerticalOffset = 25;
topShelfDepth = 65;
topShelfThickness = 7.5;
$fn = 500;

module MountBody() {
	union() {
		translate([0, bodyWidth, 0]) rotate([90, 0, 0]) linear_extrude(bodyWidth) square([bodyBackThickness, bodyBackHeight + 0]);
		translate([bodyBackThickness + baseHolsterRadius, 0, 0]) rotate([0, -90, -90]) difference() {
			linear_extrude(bodyWidth) circle(baseHolsterRadius + bodyBackThickness);
			translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) circle(baseHolsterRadius);
			translate([0, -baseHolsterRadius - bodyBackThickness, -0.5]) linear_extrude(bodyWidth + 1) square(2 * baseHolsterRadius + 2 * bodyBackThickness + 1);
		}
		translate([bodyBackThickness + topShelfDepth, 0, bodyBackHeight - topShelfVerticalOffset - topShelfThickness]) rotate([0, 0, 90]) linear_extrude(topShelfThickness) square([bodyWidth, topShelfDepth]);
	}
}

MountBody();
