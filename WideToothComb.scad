innerDiameter = 31;
cylinderHeight = 13;
innerShaftWidth = 18;
shaftFrontOffset = 12;
shaftBackOffset = 5;
lowerHeight = 29;
upperHeight = 55;

module WideToothCombIcon() {
	// TODO: Implement
}

module WideToothCombSupportBeam() {
	union() {
		cylinder(cylinderHeight, d=innerDiameter, center=false);
		intersection() {
			cylinder(upperHeight, d=innerDiameter, center=false);
			translate([-innerDiameter / 2, innerShaftWidth / 2, cylinderHeight]) rotate([90, 0, 0]) linear_extrude(innerShaftWidth) polygon([
				[0, 0],
				[shaftBackOffset, upperHeight - cylinderHeight],
				[innerDiameter - shaftFrontOffset, upperHeight - cylinderHeight],
				[innerDiameter - shaftFrontOffset, lowerHeight - cylinderHeight],
				[innerDiameter, lowerHeight - cylinderHeight],
				[innerDiameter, 0]]);
		}
	}
}
