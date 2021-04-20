.PS
# UNOSVG.m4
log_init
include(../ics.m4)
textoffset = 1.5bp__
svg_font(sans-serif,9.0bp__,textoffset)

divert(-1)

                          `Header([1|2][A],rows,wid,ht,type)
                            arg1: number of columns; A= type A
                            arg2: pins per column
                            arg3,4: custom wid, ht
                            arg5: eg fill_(0.9)'
define(`Header',
`[ define(`m4tp',ifinstr(`$1',A,A))define(`m4Hq',patsubst(`$1',A))dnl
  define(`m4Hn',`ifelse(m4Hq,,1,m4Hq)')dnl
  define(`m4Hm',`ifelse(`$2',,2,`$2')')dnl
  define(`m4Hw',`ifelse(`$3',,`m4Hn*L_unit*3',`($3)')')dnl
  define(`m4Hh',`ifelse(`$4',,`m4Hm*L_unit*3',`($4)')')dnl
  Block: rotbox(m4Hw,m4Hh,`$5')
  ifelse(`m4tp',A,`pushdef(`L_unit',(linewid/6))')
  define(`m4Hct',1)dnl
  for_(1,m4Hm,1,
   `HeaderPin(Block.NW+vec_(L_unit*3/2,-(m4x-1/2)*m4Hh/m4Hm),
     eval(m4Hct-1), P`'m4Hct,w) define(`m4Hct',incr(m4Hct))
    ifelse(m4Hn,2,`HeaderPin(Block.NE+vec_(-L_unit*3/2,-(m4x-1/2)*m4Hh/m4Hm),
       1, P`'m4Hct,e) define(`m4Hct',incr(m4Hct))') ')
  ifelse(`m4Hq',A,`popdef(`L_unit')')
  `$6' ]')
                          `HeaderPin(location,type,Picname,
                            n|e|s|w,[length][;pinsize])
                           arg2: 0= square' 
define(`HeaderPin',
 `ifinstr(`$5',;,
  `stacksplit_(`m4Hdr',`$5',;)dnl
   define(`m4Hps',ifelse(m4Hdr,,`L_unit',m4Hdr))popdef(`m4Hdr')dnl
   define(`m4Hpl',ifelse(m4Hdr,,`lg_plen*L_unit',m4Hdr))popdef(`m4Hdr') ',
  `define(`m4Hps',L_unit)dnl
   define(`m4Hpl',`ifelse(`$5',,lg_plen*L_unit,`$5')')')dnl
  ifelse(`$1',,,`move to `$1';')
  ifelse(`$3',,,`$3':) line to ifelse(
   `$4',n,`rvec_(0,m4Hpl)', `$4',e,`rvec_(m4Hpl,0)',
   `$4',s,`rvec_(0,-m4Hpl)', `rvec_(-m4Hpl,0)')
  ifelse(`$3',,,Pin`$3':) ifelse(ifelse(`$2',,0,`$2'),0,
   `rotbox(m4Hps,m4Hps,fill_(1))',
   `circle diam m4Hps fill_(1)') at last line.start ')

define(`brdge',`eleminit_(`$1')
 define(`m4h',ifelse(`$2',,`sourcerad_',`($2)/2'))dnl
 { line to rvec_(rp_len/2-m4h/2,0)
   move to rvec_(m4h/2,0)
   for m4ng=75 to 255 by 180 do {{
     m4fshade(0, arc cw from rvec_(Rect_(m4h/2,m4ng)) \
       to rvec_(Rect_(m4h/2,-m4ng)) \
         with .c at Here ) }}
   line from rvec_(m4h/2,0) to rvec_(rp_len/2,0) }
 { [box invis ht_ m4h wid_ m4h] at rvec_(rp_len/2,0) }
 line to rvec_(rp_len,0) invis ')

define(`ATMEGA16U2',`[
  Chip: box wid 10*lg_pinsep ht 25*lg_pinsep
  Loopover_(`x',
   `Arightpin(patsubst(x,;,`,'))',
   6;PD0, 7;PD1, 8;PD2, 9;PD3, 10;PD4, 11;PD5, 12;PD6, 13;PD7,
   131;nul,
   5;PC2, 26;PC4, 25;PC5, 23;PC6, 22;PC7,
   132;nul,
   133;nul,
   14;PB0, 15;PB1, 16;PB2, 17;PB3, 18;PB4, 19;PB5, 20;PB6, 21;PB7)
  Loopover_(`x',
   `Aleftpin(patsubst(x,;,`,'))',
   33;PAD,
   100;nul,
   28;UGND, 29;D`'svg_it(+), 30;D`'svg_it(-), 31;UVCC, 27;UCAP,
   101;nul, 102;nul,
   3;GND, 4;VCC, 103;nul,
   104;nul,
   32;AVCC,
   105;nul, 106;nul,
   1;XTAL1,
   107;nul,
   2;XTAL2(PC0),
   108;nul, 109;nul)
   lg_pin(Pin109+(0,lg_pinsep),RESET,Pin24,wN,24,pinlen)
  ]')
define(`Aleftpin',`move to Chip.sw+(0,m4Lx*lg_pinsep)
 Pin`$1': ifelse(`$2',nul,Here,dnl
 `line left pinlen "`$1'" above
  "`$2'" ljust at last line.start')') 
define(`Arightpin',`move to Chip.se+(0,m4Lx*lg_pinsep)
 Pin`$1': ifelse(`$2',nul,Here,dnl
 `line right pinlen "`$1'" above
  "`$2'" rjust at last line.start')') 

define(`ATMEGA328P',`[
  Chip: box wid 10*lg_pinsep ht 23*lg_pinsep
  Loopover_(`x',
   `Arightpin(patsubst(x,;,`,'))',
   2;PD0, 3;PD1, 4;PD2, 5;PD3, 6;PD4, 11;PD5, 12;PD6, 13;PD7,
   100;nul,
   23;PC0, 24;PC1, 25;PC2, 26;PC3, 27;PC4, 28;PC5,
   101;nul,
   14;PB0, 15;PB1, 16;PB2, 17;PB3, 18;PB4, 19;PB5)
  Loopover_(`x',
   `Aleftpin(patsubst(x,;,`,'))',
   201;nul, 202;nul, 203;nul, 204;nul, 205;nul, 206;nul, 207;nul, 208;nul,
   209;nul,
   8;GND, 7;VCC,
   301;nul,
   22;AGND, 20;AVCC, 21;AREF,
   302;nul,
   9;XTAL1,
   303;nul,
   9;XTAL2,
   304;nul, 305;nul)
   lg_pin(Pin305+(0,lg_pinsep),RESET,Pin1,wN,1,pinlen)
  ]')

divert(0)dnl

 maxpswid = 20
 maxpsht = 20

 define(`pinlen',`30bp__')
 define(`lg_pinsep',(1.2*lg_pinsep))
 del = lg_pinsep

 U3: ATMEGA16U2
  `"ATMEGA16U2-MU(R)"' at U3.Chip.s below
  `"U3"' at U3.Chip.nw ljust above
 ZU4: ATMEGA328P with .Chip.nw at U3.Chip.sw+(0,-1)
  `"ATMEGA328P-PU"' at ZU4.Chip.s below
  `"ZU4"' at ZU4.Chip.nw ljust above

  dot(at U3.Pin2.end)
 R1: resistor(down_ 2*lg_pinsep,,E)
  rlabel(,"R1" rjust "1M" rjust)
  dot
  dot(at R1.start-(2*del,0))
  xtal(down_ 2*lg_pinsep)
  rlabel(16,,MHz); dot
 XT2: dot(at last line.start-(2*del,0)); { "XT2" at last [].n above }

 Br1: brdge(from U3.Pin33.end to (XT2,U3.Pin33)); BRE: dot
  line to (Here,U3.Pin28) then to U3.Pin28.end
  {"UGND" at (Br1,Here) above}

 XT1: dot(at XT2-(del,R1.len)); { "XT1" at last [].n above }
  line from XT1 to U3.Pin1.end
  line from U3.Pin2.end to (XT1,XT2)
 C11: capacitor(left_ 3*del); rlabel(,C11); llabel(,22pF)
 C9: capacitor(from XT1 to (Here,XT1)); {"C9" "22pF" at last [].s+(0,-11bp__)}
  { line to C11.end }
  dot
 G1: ground(,,E); { "GND" at last line.c below }
  line from XT1 down_ 3*del; continue to (G1,Here); dot(,,1)
  {"XT3" at last [].n above}
  dot(at Here+(0,-3/2*del),,1); {"XT4" at last [].n above}
  { line to (XT2,Here) then to XT2 chop dotrad_ chop 0 }
  USBVCC: dot(at Here+(0,-7/2*del),,1)
  {"USBVCC" at last [].n-(3/2*del,0) above ljust}
  { line to (Here,U3.Pin31) chop dotrad_ chop 0; continue to U3.Pin31.end }
  dot(at Here+(2*del,0),,1); {"VUCAP" at last [].e+(0,-5bp__) ljust}
  line to (Here,U3.Pin27) chop dotrad_ chop 0; dot
  line from U3.Pin27.end to (G1.x-4.5*del,U3.Pin27.y)
 C8: capacitor(down_ to (Here,Br1)); llabel(C8,,1`'svg_micro) 
 Bus1: dot

  dot(at U3.Pin33.end)
  move to U3.Pin3.end; line to (Here,U3.Chip.s)
 G2: ground(,T,E); {"GND" at last line.c below }

 dot(at U3.Pin32.end)
 {line to U3.Pin4.end; dot}
 line left del; ground(,,E,U); {"svg_it(+)5V" at last line.c above}

 G3: ground(at (C8.x-del,G2.y),T,E);  {"GND" at last line.c below }
  capacitor(up_ to (Here,C8.start)); { llabel(100n,,C7) }
  line to (Here,U3.Pin4) then to U3.Pin4.end

  line from U3.Pin30.end to (G1.x-2*del,U3.Pin30.y); continue to (Here,U3.Pin1)
  { "RD`'svg_it(-)" above rjust }; continue left_ 2*del
 RN3A: resistor(left_ 3/2*dimen_,,E); rlabel(,22R RN3A)
 Dm: line left_ 7*del

USB: [ K: box invis wid dimen_/2 ht 5*lg_pinsep
  "USB" rjust at K.e
  line thick 1.5 from K.nw to K.ne then to K.se then to K.sw
  Loopover_(`x',
   `Pin`'m4Lx: K.ne-(0,m4Lx/5*K.ht)
    "x" at Pin`'m4Lx ljust above',
   1 XUSB, 2 D`'svg_it(-), 3 D`'svg_it(+), 4 UGND)
  P_1: K.sw; {"P$`1'" at P_1 below rjust}
  P_2: K.s; {"P$`2'" at P_2 below ljust}
  ] with .Pin2 at Here; "X2" at USB.ne above rjust

  move to U3.Pin29.end
  line to (G1.x-3*del,Here.y); continue to (Here,Dm-(0,lg_pinsep))
  { "RD`'svg_it(+)" above rjust}
  continue to (RN3A.start,Here)
 RN3D: resistor(left_ 3/2*dimen_,,E); llabel(,22R RN3D)
  line to USB.Pin3

   dot(at RN3A.end); line to (Here,RN3D)
 Z2: variable(`resistor(down_ to (Here,U3.Pin27),,E); rlabel(Z2)',NN)
   dot(at RN3D.end-(2*del,0))
 Z1: variable(`resistor(to (Here,U3.Pin27),,E); rlabel(Z1)',NN)
   dot; line to (Z2,Here)
   move up Z1.len/4 from last line.c; "CG0603MLC-05E" "X 2"

   line down_ del from USB.P_1; continue to (USB.P_2,Here); dot
   line from USB.P_2 to (USB.P_2,Z1.end) then to Z1.end
   dot(at (USB.P_2,Here)+(3/2*del,0)); line to (Here,USBVCC)
   dot(,,1); {"USHIELD" at last [].n+(4bp__,0) above}

  L1: reversed(`inductor',down_ from Z1.end to (Z1,C8.end),W,,M)
   rlabel(L1); llabel( BLM21); dot
   { dot(at (Z2,Here)); line to (Here,U3.Pin28); dot(,,1)
     "UGND" at last [].n above }
   line from USB.Pin1 to (Z2,USB.Pin1) then up 2*del
  XUSB: dot(,,1); {"XUSB" at last [].n above}
   line from (Z1,USB.Pin3) to (Z1,XUSB);
  DP: dot(,,1); {"D`'svg_it(+)" at last [].n above}
   dot(at (DP,USB.Pin2)-(2*del,0)); line to (Here,XUSB)
  DM: dot(,,1); "D`'svg_it(-)" at last [].n above
   line from USB.Pin4 to (DM,USB.Pin4) then to (DM,BRE) then to BRE

   dot(at (U3.Chip.w.x-3*lg_pinsep,U3.Pin24.y))
  D3: diode(up_ 7*lg_pinsep); llabel(,,D3)
   dot(at (D3.start-(2*del,0)))
  RN1C: resistor(up_ D3.len,,E); llabel(,10K); llabel(RN1C); dot
   line from D3.end to (Here.x-2*del,Here.y)
   right_
  ICSP1: Header(2A,3,4*del,3*lg_pinsep) with .P2.end at Here
   "ICSP1" at last [].Block.nw above ljust
   "3X2 M" at last [].Block.sw below ljust
   for_(1,5,2,`"m4x" at ICSP1.P`'m4x.end above ljust')
   for_(2,6,2,`"m4x" at ICSP1.P`'m4x.end above rjust')
  
   dot(at ICSP1.P2.end+(del/2,0)); line up_ 2*del
  G5: ground(,T,E); "svg_it(+)5V" above
   ground(at (G5,ICSP1.P6),,E); {"GND" at last line.w below rjust}
   {line to ICSP1.P6.end}
  R2: dot(at ICSP1.P5.end-(lg_pinsep/2,0)); {line to ICSP1.P5.end}
   { line to (Here,G5); dot(,,1); "RESET2" at last [].n above }
   line to (R2,U3.Pin24) then to U3.Pin24.end
   line from ICSP1.P4.end to (U3.Pin24.end,ICSP1.P4); dot
   { line to (Here,G5); dot(,,1); "MOSI2" at last [].n above }
  Turn: (U3.Pin21.end.x+4*lg_pinsep,Here.y)
   line to (Turn,Here) then down Here.y-U3.Pin16.y then to U3.Pin16.end
   line from ICSP1.P3.end to (R2.x-lg_pinsep,ICSP1.P3.y) \
     then down R2.y-U3.Pin24.y
   continue to (D3.x+2*del,Here.y) then up ICSP1.P4.y-Here.y-2*lg_pinsep
   continue to (Turn.x-2*lg_pinsep,Here.y) then down Here.y-U3.Pin15.y \
     then to U3.Pin15
   move to ICSP1.P1.end; line left Here.x-R2.x+2*lg_pinsep; dot
   { line to (Here,G5); dot(,,1); "MISO2" at last [].n above rjust }
   line down Here.y-U3.Pin24.y-2*lg_pinsep 
   continue to (D3.x+del,Here.y) then up ICSP1.P4.y-Here.y-lg_pinsep
   continue to (Turn.x-lg_pinsep,Here.y) then down Here.y-U3.Pin17.y \
     then to U3.Pin17

  command "</g>"
.PE
