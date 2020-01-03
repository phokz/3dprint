/* adamkova raketa spodni cast */

$fn = 50;
d = 30;
thickness = 1;
h = 170; 
// h = 80;
motor_dia = 18;
motor_l = 70;

wings_angle = 40; /* ignored ftm */
wings_l = 30;
wings_th = 2;
wings_h = 40;
wings_r = 7;
wings_endh = 20;

module wing() {
  rotate([0,-90,0])
    translate([0,0,-wings_th/2])
      hull(){
  linear_extrude(height=wings_th)
    polygon(points=[
    [0,0],
    [0,wings_l],
    [wings_endh-wings_r,wings_l-wings_r],
    [wings_h,0]
    ]);
  translate([wings_endh-wings_r,wings_l-wings_r,0])cylinder(r=wings_r, h=wings_th);
  }
}

translate([0,d/2,0])wing();

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

stopper = 4;

difference(){
    union(){
        cylinder(d=motor_dia+2*thickness,h=motor_l);
        translate([0,0,motor_l])cylinder(d=motor_dia+2*thickness,h=stopper);
    }
    cylinder(d=motor_dia, h=motor_l);
    translate([0,0,motor_l])cylinder(r1=motor_dia/2, r2=motor_dia/2-stopper/4, h=stopper);
}

/* wings */
for (i=[0:90:360]){
  rotate([0,0,i]){
    translate([0,d/2,0])wing();
  }
}
    
