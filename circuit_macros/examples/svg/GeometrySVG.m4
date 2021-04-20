.PS
# Geometry.m4
gen_init
 scale = 5/4

 A: Here;               "A" at A above
 B: A+(-1,-3.5);        "B" at B below rjust 
 C: B+(4.6,0);          "C" at C below ljust
 AB: line from A to B
 BC: line from B to C
 CA: line from C to A

 PerpTo(A,BC,L);        "L" at L below
 AL: line from A to L; RightAngle(A,L,C)

 angleLAC = atan2(C.x-L.x,A.y-L.y)
 S: move from A to (sin(angleLAC/2),-cos(angleLAC/2)) 
 AW: line from A to Intersect_(S,BC)
 W: Here;               "W" at W below rjust

 PerpTo(C,AB,N);        "N" at N above rjust
 CN: line from C to N; RightAngle(C,N,B)

 PerpTo(B,CA,M);        "M" at M above
 CM: line from B to M; RightAngle(B,M,C)

 H: Intersect_(CN,AL);  "H" at H +(4bp__,10bp__)

 thinlines_
 Equidist3(B,L,N,CC1,c1rad); C1: circle rad c1rad at CC1
 Equidist3(B,W,N,CC2,c2rad); C2: circle rad c2rad at CC2
 Equidist3(B,C,N,CC3,c3rad); C3: circle rad c3rad at CC3
 Equidist3(W,C,M,CC4,c4rad); C4: circle rad c4rad at CC4
 thicklines_

 Z: LCintersect(AW,CC2,C2.rad);   "Z" at Z+(-5bp__,-5bp__)
 HZ: move from H to Z
 Y: LCintersect(HZ,CC4,C4.rad,R); "Y" at Y above
 X: LCintersect(HZ,CC2,C2.rad);   "X" at X above rjust

 Loopover_(`P',`dot(at P)',X,Y,Z)

 line dashed from X to Y chop -linewid/2
 RightAngle(A,Z,Y)

.PE
