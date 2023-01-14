$fn = 32;

LogitechCameraStand("RD");

module LogitechCameraStand(text, text_size) {
    a = 8.5;
    b = 20;
    c = 1.7;
    d = 6;
    e = 2;
    f = 4;
    g = 8;
    h = 1;
    i = 19;
    bottom = 3;
    
    difference() {
        union() {
            rotate(-20, v=[0,1,0]) translate([0,0,b + bottom]) rotate(90, v=[1,0,0]) {
                linear_extrude(height=i, center=true, convexity=2) difference() {
                    union() {
                        polygon(points = [
                            [-g, -b * 2],
                            [-g, a - f],
                            [-g + f, a],
                            [c, a],
                            [c, d / 2 + e],
                            [0, d / 2],
                            [0, -d / 2],
                            [c, -d / 2 - h],
                            [c, -b * 2]]);
                        translate([-g + f, a - f]) circle(r=f);
                    }
                    circle(d=d);
                }
            }
            rotate_extrude($fn = $fn * 3) {
                hull() {
                    translate([20, -bottom/2]) circle(r= bottom / 2);
                    polygon([
                        [0, 0],
                        [0, -bottom],
                        [20 + bottom/2, -bottom]
                    ]);
                }
            }
        }
        translate([0,0,-100 - bottom]) cube(200, center=true);
        translate([13, 0, -.5]) rotate (90, [0,0,1]) linear_extrude(height=1) {
            text(text, size = text_size, halign="center");
        }
    }
}