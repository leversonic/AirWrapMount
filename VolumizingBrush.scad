smallInnerDiameter = 28.5;
largeInnerDiameter = 31.5;
smallInnerDiameterInnerVerticalOffset = 8;
smallInnerDiameterOuterVerticalOffset = 10;
innerHeight = 18;

module VolumizingBrushIcon() {
	translate([126, 17.5, 0]) circle(8);
	difference() {
		offset(8) square([118, 35]);
		square([118, 35]);
	}
	for(i = [0:4]) {
		translate([i * 22 + 10, 42.5, 0]) square([6, 20]);
		translate([i * 22 + 10, -27.5, 0]) square([6, 20]);
	}
}

module VolumizingBrushSupportBeam() {
	rotate_extrude() polygon([[0, 0], [0, innerHeight], [smallInnerDiameter / 2, innerHeight], [smallInnerDiameter / 2, innerHeight - smallInnerDiameterInnerVerticalOffset], [largeInnerDiameter / 2, innerHeight - smallInnerDiameterOuterVerticalOffset], [largeInnerDiameter / 2, 0]]);
}
