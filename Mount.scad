use <SmoothingBrush.scad>;
use <VolumizingBrush.scad>;
use <AccessoryIndentation.scad>;
use <Barrel.scad>;
use <SmoothingDryer.scad>;
use <Diffuser.scad>;
use <WideToothComb.scad>;
include <Shared.scad>;

$fn = 200;

module MountBody() {
	union() {
		difference() {
			union() {
				bodyOffset = (bodyBackThickness + topShelfDepth) * tan(wingAngle);
				translate([0, bodyWidth - bodyOffset, 0]) rotate([90, 0, 0]) linear_extrude(bodyWidth) polygon([
					[0, 0],
					[0, bodyBackHeight],
					[bodyBackThickness, bodyBackHeight - (topShelfDepth + bodyBackThickness) / 2],
					[bodyBackThickness, 0]]);
				translate([bodyBackThickness + baseHolsterRadius, -bodyOffset, 0]) rotate([0, -90, -90]) union() {
					outerCircleRadius = baseHolsterRadius + bodyBackThickness;
					difference() {
						linear_extrude(bodyWidth) circle(outerCircleRadius);
						translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) circle(baseHolsterRadius);
						translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) polygon([[outerCircleRadius + 1, outerCircleRadius + 1], [-outerCircleRadius - 1, outerCircleRadius + 1], [-outerCircleRadius, outerCircleRadius], [0, 0], [0, -outerCircleRadius - 1], [outerCircleRadius + 1, -outerCircleRadius - 1 ]]);
					}
					translate([-outerCircleRadius * sin(45), outerCircleRadius * sin(45), 0]) rotate([0, 0, -45]) linear_extrude(bodyWidth) square([bodyBackThickness, baseHolsterLipLength]);
				}
				translate([bodyBackThickness + topShelfDepth, 0, bodyBackHeight - topShelfVerticalOffset - topShelfThickness]) rotate([0, 0, 90]) linear_extrude(topShelfThickness) square([frontWidth, topShelfDepth + bodyBackThickness]);
			translate([0, 0, bodyBackHeight - topShelfVerticalOffset]) mirror([0, 1, 0]) AngleMount(wingAngle) DiffuserSupportBeam();
			translate([0, frontWidth, bodyBackHeight - topShelfVerticalOffset]) AngleMount(wingAngle) WideToothCombSupportBeam();
			}
			translate(calculateIndentationCenter(0)) AccessoryIndentation();
			translate(calculateIndentationCenter(1)) AccessoryIndentation(false);
			translate(calculateIndentationCenter(2)) AccessoryIndentation(false);
			translate(calculateIndentationCenter(3)) AccessoryIndentation();
			translate([bodyBackThickness + topShelfDepth + 0.99, frontWidth / 8, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([0, -90, 0]) linear_extrude(1) scale((topShelfThickness - 8) / 118) SmoothingBrushIcon();
			translate([bodyBackThickness + topShelfDepth + 0.99, 3 * frontWidth / 8, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([0, -90, 0]) linear_extrude(1) scale((topShelfThickness - 8) / 118) VolumizingBrushIcon();
			translate([bodyBackThickness + topShelfDepth + 0.99, 5 * frontWidth / 8 + 0.5, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([-90, 180, 90]) linear_extrude(1) scale((topShelfThickness - 8) / 18) BarrelIcon();
			translate([bodyBackThickness + topShelfDepth - 0.99, 7 * frontWidth / 8 - 4.5, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([-90, 180, -90]) linear_extrude(1) scale((topShelfThickness - 8) / 35) SmoothingDryerIcon();
		}
		translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(0)) SmoothingBrushSupportBeam();
		translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(1)) SmoothingDryerSupportBeam();
		translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(2)) BarrelSupportBeam();
		translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(3)) VolumizingBrushSupportBeam();
	}
}

module AngleMount(angle, supportBeam) {
	depth = topShelfDepth + bodyBackThickness;
	mountPoints = [
		[0, 0, 0],
		[depth, 0, 0],//top right
		[depth, 0, -topShelfThickness],
		[bodyBackThickness, 0, -depth],
		[0, 0, -depth],
		[0, tan(angle) * depth, -depth],
		[sin(angle) * depth, tan(angle) * depth + cos(angle) * depth, -depth],//bottom left
		[(1 + sin(angle)) * depth, cos(angle) * depth, -depth],//bottom right
		[0, tan(angle) * depth, 0]];//top left
	mountFaces = [
		[0, 1, 2, 3, 4],
		[8, 1, 0],
		[8, 6, 7, 1],
		[7, 2, 1],
		[7, 3, 2],
		[7, 6, 5, 4, 3],
		[5, 6, 8],
		[0, 4, 5, 8]
	];
	union() {
		difference() {
			polyhedron(mountPoints, mountFaces, convexity=10);
			translate([(1 + sin(angle)) * depth / 2, (tan(angle) + cos(angle)) * depth / 2, -depth / 2]) rotate([0, 45, 90 - angle]) translate([0, 0, 1.77]) AccessoryIndentation();
		}
		translate([(1 + sin(angle)) * depth / 2, (tan(angle) + cos(angle)) * depth / 2, -depth / 2]) rotate([0, 45, 90 - angle]) translate([0, 0, -indentationDepth]) children();
	}
}

translate([0, (tan(30) + cos(30)) * (topShelfDepth + bodyBackThickness), 0]) union() {
	MountBody();
}
