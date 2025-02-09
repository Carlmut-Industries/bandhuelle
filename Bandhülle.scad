include <BOSL2/std.scad>

$fa = 1;
$fs = 1;

w = 30;
d = 54;
h = 27;

button_d = 40;
button_h = 3;

diff(keep="rib")
cuboid([button_d+4, h+4, d+2], rounding=10, teardrop=true)
attach(TOP,TOP,inside=true) {
    cuboid([w, h, d], rounding=5, except=[TOP]) {
        // Cut for Button
        attach(TOP,TOP,inside=true)
        cuboid([button_d,button_h,d*0.9], rounding=1, edges=[LEFT, RIGHT]);
        
        // Ribs
        for (i = [-5:5:5])
        attach([FRONT, BACK])
        tag("rib") left(i) ycyl(h=d/2, d=2, rounding=1);
        
        // Stamp
        attach(BOT)
        text3d("Carl", font="TeX Gyre Pagella:style=Regular", center=true, size=8, orient=DOWN);
    }
}