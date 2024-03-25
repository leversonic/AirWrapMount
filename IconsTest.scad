use <SmoothingBrush.scad>;
use <VolumizingBrush.scad>;
use <Barrel.scad>;
use <SmoothingDryer.scad>;
use <Diffuser.scad>;
use <WideToothComb.scad>;
$fn = 200;

difference() {
	linear_extrude(5) square([30, 95]);
	translate([15, 15, 2.01]) linear_extrude(3) DiffuserIcon();
	translate([15, 35, 2.01]) linear_extrude(3) WideToothCombIcon();
	scaleFactor = 7 / 80;
	translate([10, 55, 3.01]) linear_extrude(2) scale(scaleFactor) SmoothingBrushIcon();
	translate([20, 70, 3.01]) linear_extrude(2) scale(scaleFactor) rotate([0, 0, 180]) VolumizingBrushIcon();
	translate([20.5, 75, 3.01]) linear_extrude(2) rotate([0, 0, 90]) scale(7/12) BarrelIcon();
	translate([20, 82, 3.01]) linear_extrude(2) rotate([0, 0, 90]) scale(7/23) SmoothingDryerIcon();
}
