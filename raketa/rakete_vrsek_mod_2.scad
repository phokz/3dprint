/* raketa pro Adamka */
$fn=50;
nose_d = 30;
nose_l = 100;
step = 2;
thickness=1;
rantl_l=15;
diry_soupnout=5;
diry_d=5;

module cr2032_holder(){
  difference(){
    union(){
     rotate([0,0,90])translate([7,-2,0])difference(){
        cube([6,4,10.2]);  
         translate([0,5,8.2])rotate([90,0,45])cylinder(d=1, h=70);
     }
     rotate([0,0,-150])translate([5,-2,0]){
         difference(){
         cube([8,4,10.2]);
         translate([2,5,0])rotate([45,0,0])cylinder(d=1, h=10);
         }  
     }
     rotate([0,0,-30])translate([7,-2,0])cube([6,4,10.2]);  
    }    
  union(){
    translate([0,0,3])cylinder(d=20,h=6.4);
    translate([0,0,9.2])cylinder(r1=19/2, r2=20/2,h=1.1);
  }
  }    
}

difference(){
union(){
    cylinder(d=nose_d-(2*thickness), h=rantl_l);
}
  translate([0,0,1])cylinder(d=(nose_d-4*thickness), h=rantl_l);
  translate([5,diry_soupnout,0])cylinder(d=diry_d,h=rantl_l);
  translate([-5,diry_soupnout,0])cylinder(d=diry_d,h=rantl_l);
}
cr2032_holder();
