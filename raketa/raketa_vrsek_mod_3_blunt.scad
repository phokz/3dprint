/* raketa pro Adamka */
$fn=50;
nose_d = 30;
nose_l = 100;
step = 2;
thickness=1;
rantl_l = 10;
factor = 0.8;

module nose_top() {
  translate([0,0,1+nose_l*factor])
    difference(){sphere(d=10);
    sphere(d=9);    
    translate([0,0,-10])cylinder(d=10,h=10);
    }
}

module nose() {
for (i=[0:step:(nose_l*factor)]) {
 echo(i);
 d=nose_d - i*i/nose_l/nose_l*nose_d;
 d2=nose_d - (i+step)*(i+step)/nose_l/nose_l*nose_d;
 translate([0,0,i])difference(){
    cylinder(h=step, r1=d/2, r2=d2/2);
    cylinder(h=step, r1=(d-2*thickness)/2, r2=(d2-2*thickness)/2);
 }
}
}



    nose();
    nose_top();
