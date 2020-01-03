/* raketa pro Adamka */
$fn=50;
nose_d = 30;
nose_l = 100;
step = 2;
thickness=1;
rantl_l = 10;

module nose() {
for (i=[0:step:nose_l]) {
 echo(i);
 d=nose_d - i*i/nose_l/nose_l*nose_d;
 d2=nose_d - (i+step)*(i+step)/nose_l/nose_l*nose_d;
 translate([0,0,i])difference(){
    cylinder(h=step, r1=d/2, r2=d2/2);
    cylinder(h=step, r1=(d-2*thickness)/2, r2=(d2-2*thickness)/2);
 }
}
}

translate([0,0,10])nose();

difference(){
union(){
    cylinder(d=nose_d-(2*thickness), h=rantl_l);
    translate([0,0,8])cylinder(r2=nose_d/2, r1=nose_d/2-thickness, h=2);
}
  translate([0,0,1])cylinder(d=(nose_d-4*thickness), h=rantl_l);
  translate([5,0,0])cylinder(d=5,h=rantl_l);
  translate([-5,0,0])cylinder(d=5,h=rantl_l);
}