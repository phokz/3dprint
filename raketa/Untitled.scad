$fn=50;

module three(a=15, d=5, h=1) {
  for (i=[0:120:360]) {
    rotate(i)translate([a,0,0])cylinder(d=d,h=h);
  }
}

module four(a=15, d1=2, d2=4, h=1) {
  for (i=[0:120:360]) {
    rotate(i)translate([a,0,0])cylinder(r1=d1/2,r2=d2/2,h=h);
  }
}

module spodek() {
  hull()three();
  translate([0,0,1])three();
  cylinder(d=18,h=2);
}

difference(){
    spodek();
    union(){
      cylinder(d=16,h=2);
      three(d=2,h=5);
      translate([0,0,1])four();
    }
}