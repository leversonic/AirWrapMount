topHeight = 39;
bottomHeight = 29;
innerDiameter = 31;

module DiffuserIcon() {
	difference() {
		circle(11);
		circle(10);
	}
	circle(2.5);
	for(i = [36:36:360]) {
		outerRadius = 7;
		translate([outerRadius * cos(i), outerRadius * sin(i), 0]) circle(1);
	}
}

module DiffuserSupportBeam() {
	rotate([0, 0, 180]) intersection() {
		cylinder(topHeight + 1, d=innerDiameter, center = false);
		translate([-innerDiameter / 2, innerDiameter / 2, 0]) rotate([90, 0, 0]) linear_extrude(innerDiameter + 1) polygon([[0, 0], [0, bottomHeight], [innerDiameter, topHeight], [innerDiameter, 0]]);
	}
}
