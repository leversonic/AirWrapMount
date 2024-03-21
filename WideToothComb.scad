innerDiameter = 31;
cylinderHeight = 13;
innerShaftWidth = 18;
shaftFrontOffset = 12;
shaftBackOffset = 5;
lowerHeight = 29;
upperHeight = 55;

module WideToothCombIcon() {
	scale([0.625, 0.625, 1]) {
		difference() {
			square([22, 17], center=true);
			square([20, 15], center=true);
		}
		for(i = [1.5:3:19.5]) {
			translate([i - 11, 8.5, 0]) square([1, 17]);
		}
	}
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
