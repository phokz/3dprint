hole_dia=42;
height=160;
polygon_count=6;
base_thickness=2;
wall_thickness=1.2;
r = 245 / 2;

module regular_polygon(order, r=1){
        angles=[ for (i = [0:order-1]) i*(360/order) ];
        coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
        polygon(coords);
}

module base() {
difference(){
  linear_extrude(height=base_thickness)regular_polygon(polygon_count, r);
  linear_extrude(height=base_thickness)regular_polygon(polygon_count, r - 10);
  }
difference(){
  linear_extrude(height=base_thickness)regular_polygon(polygon_count, hole_dia/2 + 10);
  cylinder(d=hole_dia, h=100);
}

intersection(){
for (i=[0:30:360])rotate([0,0,i])translate([-5,hole_dia/2,0])cube([10,r,base_thickness]);
linear_extrude(height=base_thickness)regular_polygon(polygon_count, r);

}
}

module shell() {
difference(){
    linear_extrude(height=height, slices=80, twist=60)  regular_polygon(polygon_count, r);
    linear_extrude(height=height, slices=80, twist=60)  regular_polygon(polygon_count, r-wall_thickness);
    }
}    


base();
translate([0,0,base_thickness])shell();
