height = 12;
innerDiameter = 30;

module SmoothingDryerIcon() {
	difference() {
		offset(2) IconLines();
		IconLines();
	}
	translate([19, 0, 0]) square([2, 24]);
}

module IconLines() {
	polygon([[0, 0], [3, 2], [3, 22], [0, 24], [3, 24], [6, 27], [6, 35], [12, 35], [12, 27], [15, 24], [24, 24], [24, 0]]);
}

module SmoothingDryerSupportBeam() {
	cylinder(height, d=innerDiameter);
}
