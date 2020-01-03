/* adamkova raketa spodni cast */

$fn = 50;
d = 30;
thickness = 1;
h = 170;
//h = 75;
motor_dia = 18;
motor_l = 70;

wings_angle = 40;
wings_l = 30;
wings_th = 2;
wings_h = 40;

module poutko(d=d+4,h=7,z=30,rot=0) {
  rotate([0,0,45])translate([d/2,0,z]){
     difference(){cylinder(h=h,d=7);
         union(){
           cylinder(h=h,d=5);
             rotate([0,-45,rot])translate([-4,-4,-7.5])cube([9.5,9.5,8]);
           
         }
      }
  }
}

poutko();
poutko(z=150);
rotate([0,0,180])poutko(z=150,d=d-7,rot=180);

module three(a=12, d=5, h=1) {
  for (i=[0:120:360]) {
    rotate(i)translate([a,0,0])cylinder(d=d,h=h);
  }
}

module vyztuhy(){
  for (i=[0:60:360])rotate([0,0,i])translate([motor_dia/2,-thickness/2,0])cube([(d-motor_dia-1)/2,thickness,motor_l+3]);
}
difference(){
union(){
    cylinder(d=d, h=h);
    three(d=4,h=5);
    }
union(){
translate([0,0,thickness])cylinder(d=d-2*thickness,h=h);
cylinder(d=motor_dia, h=motor_l);
 three(d=2);
}
}
difference(){
 union(){
   three(d=4,h=7);
   vyztuhy();
 }
 three(d=2,h=6);
}

difference(){
    union(){
        cylinder(d=motor_dia+2*thickness,h=motor_l);
        translate([0,0,motor_l])cylinder(d=motor_dia+2*thickness,h=thickness);
    }
    cylinder(d=motor_dia, h=motor_l);
    translate([0,0,motor_l])cylinder(d=motor_dia-2*thickness, h=thickness);
}

for (i=[0:90:360]){
    rotate([0,0,i]){
    difference(){
    translate([d/2,-wings_th/2,0])cube([wings_l,wings_th,wings_h]);
    translate([d/2,-wings_th/2,wings_h])rotate([0,wings_angle,0])cube([wings_h,wings_th,wings_h]);
        
        
        
    }
    }
    
}
