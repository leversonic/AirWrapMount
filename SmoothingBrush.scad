innerTopHeight = 47;
innerTopHorizontalOffset = 2;
innerBottomHeight = 21;
innerBottomHorizontalOffset = 7;
innerDiameter = 31;

module SmoothingBrushIcon() {
	difference() {
		offset(10) square([118, 64]);
		square([118, 64]);
	}
	for(i = [0:2]) {
		for(j = [0:3]) {
			translate([j * 27 + 18, i * 18 + 14, 0]) circle(6, $fn=25);
		}
	}
}

module SmoothingBrushSupportBeam() {
	intersection() {
		cylinder(innerTopHeight, d=innerDiameter);
		translate([-innerDiameter / 2, innerDiameter / 2, 0]) rotate([90, 0, 0]) linear_extrude(innerDiameter + 1) polygon([[0, 0], [0, innerTopHeight], [innerTopHorizontalOffset, innerTopHeight], [innerDiameter - innerBottomHorizontalOffset, innerBottomHeight], [innerDiameter, innerBottomHeight], [innerDiameter, 0]]);
	}
}
