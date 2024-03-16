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
	for(i = [0:9]) {
		translate([i * 11 + 4, 42.5, 0]) square([4, 15]);
		translate([i * 11 + 4, -22.5, 0]) square([4, 15]);
	}
}

module VolumizingBrushSupportBeam() {
	rotate_extrude() polygon([[0, 0], [0, innerHeight], [smallInnerDiameter / 2, innerHeight], [smallInnerDiameter / 2, innerHeight - smallInnerDiameterInnerVerticalOffset], [largeInnerDiameter / 2, innerHeight - smallInnerDiameterOuterVerticalOffset], [largeInnerDiameter / 2, 0]]);
}
