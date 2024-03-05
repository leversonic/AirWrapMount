topHeight = 39;
bottomHeight = 29;
innerDiameter = 31;

module DiffuserIcon() {
	difference() {
		circle(11);
		circle(10);
	}
	difference() {
		circle(6.5);
		circle(5.5);
	}
	circle(1.5);
	for(i = [0:18:360]) {
		outerRadius = i % 36 ? 8.5 : 7.75;
		innerRadius = 3.75;
		translate([outerRadius * cos(i), outerRadius * sin(i), 0]) circle(0.75);
		if (i % 36) {
			translate([innerRadius * cos(i), innerRadius * sin(i), 0]) circle(0.75);
		}
	}
}

module DiffuserSupportBeam() {
	rotate([0, 0, 180]) intersection() {
		cylinder(topHeight + 1, d=innerDiameter, center = false);
		translate([-innerDiameter / 2, innerDiameter / 2, 0]) rotate([90, 0, 0]) linear_extrude(innerDiameter + 1) polygon([[0, 0], [0, bottomHeight], [innerDiameter, topHeight], [innerDiameter, 0]]);
	}
}
