smallInnerDiameterBottom = 22;
smallInnerDiameterTop = 14;
largeInnerDiameter = 31.5;
innerHeight = 50;
innerDiameterVerticalOffset = 7.5;
innerDiameterFlareVerticalOffset = 37;

module BarrelIcon() {
	difference() {
		offset(1) polygon([[0, 0], [1, 3], [1, 20], [5, 20], [5, 3], [6, 0]]);
		polygon([[0, 0], [1, 3], [1, 20], [5, 20], [5, 3], [6, 0]]);
	}
}

module BarrelSupportBeam() {
	rotate_extrude() polygon([[0, 0], [0, innerHeight], [smallInnerDiameterTop / 2, innerHeight], [smallInnerDiameterTop / 2, innerDiameterFlareVerticalOffset], [smallInnerDiameterBottom / 2, innerDiameterVerticalOffset], [largeInnerDiameter / 2, innerDiameterVerticalOffset], [largeInnerDiameter / 2, 0]]);
}
