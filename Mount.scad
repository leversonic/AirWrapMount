use <SmoothingBrush.scad>;
use <VolumizingBrush.scad>;
use <AccessoryIndentation.scad>;
use <Barrel.scad>;
include <Shared.scad>;

$fn = 200;

module MountBody() {
		union() {
			difference() {
				union() {
					translate([0, bodyWidth, 0]) rotate([90, 0, 0]) linear_extrude(bodyWidth) square([bodyBackThickness, bodyBackHeight + 0]);
					translate([bodyBackThickness + baseHolsterRadius, 0, 0]) rotate([0, -90, -90]) union() {
						outerCircleRadius = baseHolsterRadius + bodyBackThickness;
						difference() {
							linear_extrude(bodyWidth) circle(outerCircleRadius);
							translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) circle(baseHolsterRadius);
							translate([0, 0, -0.5]) linear_extrude(bodyWidth + 1) polygon([[outerCircleRadius + 1, outerCircleRadius + 1], [-outerCircleRadius - 1, outerCircleRadius + 1], [-outerCircleRadius, outerCircleRadius], [0, 0], [0, -outerCircleRadius - 1], [outerCircleRadius + 1, -outerCircleRadius - 1 ]]);
						}
						translate([-outerCircleRadius * sin(45), outerCircleRadius * sin(45), 0]) rotate([0, 0, -45]) linear_extrude(bodyWidth) square([bodyBackThickness, baseHolsterLipLength]);
					}
					translate([bodyBackThickness + topShelfDepth, 0, bodyBackHeight - topShelfVerticalOffset - topShelfThickness]) rotate([0, 0, 90]) linear_extrude(topShelfThickness) square([bodyWidth, topShelfDepth]);
				}
				translate(calculateIndentationCenter(0)) AccessoryIndentation();
				translate(calculateIndentationCenter(1)) AccessoryIndentation(false);
				translate(calculateIndentationCenter(2)) AccessoryIndentation(false);
				translate(calculateIndentationCenter(3)) AccessoryIndentation();
				translate([bodyBackThickness + topShelfDepth + 0.99, bodyWidth / 8, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([0, -90, 0]) linear_extrude(1) scale((topShelfThickness - 8) / 118) SmoothingBrushIcon();
				translate([bodyBackThickness + topShelfDepth + 0.99, 3 * bodyWidth / 8, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([0, -90, 0]) linear_extrude(1) scale((topShelfThickness - 8) / 118) VolumizingBrushIcon();
				translate([bodyBackThickness + topShelfDepth + 0.99, 5 * bodyWidth / 8 + 0.5, bodyBackHeight - topShelfVerticalOffset - topShelfThickness * 3 / 4]) rotate([-90, 180, 90]) linear_extrude(1) scale((topShelfThickness - 8) / 18) BarrelIcon();
			}
			translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(0)) SmoothingBrushSupportBeam();
			translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(1)) VolumizingBrushSupportBeam();
			translate([0, 0, -indentationDepth - 0.01]) translate(calculateIndentationCenter(2)) BarrelSupportBeam();
		}
}

MountBody();
