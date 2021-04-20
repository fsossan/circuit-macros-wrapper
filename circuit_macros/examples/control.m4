.PS
# control.m4
gen_init
  linewid = linewid*0.8
  circlerad = 0.35/2
  bw = boxwid/2
  bh = boxht/2

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #

PID: [
  {"$r(s)$" above ljust}
  arrow
S1: circle
  line right "$e(s)$" above
  { arrow right ; box ht bh wid bw "$K_p$"
    arrow right linewid-circlerad ; S2: circle }
  { line up linewid ; arrow right ; box ht bh wid bw "$K_D s$"
    line to (S2,Here) ; arrow to S2.n }
  { line down linewid ; arrow right ; box ht bh wid bw "$K_I/s$"
    line to (S2,Here) ; arrow to S2.s }
  arrow right from S2.e "$u(s)$" above
  box "$G(s)$"
  arrow right ; "$y(s)$" above rjust at Here+(0,2pt__)
  line down boxht*3/2 from last arrow.c then left last arrow.c.x-S1.x
  arrow to S1.s
  "$-\;$" below rjust
]
  "(a) $PID$ control" below ljust at PID.sw+(0,-5pt__)

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #

Observer: [ {"$r$" above ljust}
  arrow
S: circle
  "$-\;$" below rjust at S.s
  arrow <- down linewid/2 from S.s
  box ht bh wid bw "$K$"
  arrow <- down linewid/2
  line right linewid "$\hat x$" above
Obs:box wid linewid*5 ht boxht*5/4 \
    "$\frac{d}{dt}\hat x = (A{-}LC)\hat x + B u + L y$" 
  "\sl Observer" above ljust at Obs.sw
  arrow <- right linewid/2 from 3/4<Obs.se,Obs.ne>
  line to (Here,S)
  {"$u$" above at Here+(linewid/2,0)}
  arrow from S.e to Here+(linewid,0)
Plant: box wid boxwid*3/2 ht boxht*5/4 \
    "$\frac{d}{dt} x=Ax+Bu$" "$\quad y=Cx$\hfill\hbox{}"
  "\sl Plant" above ljust at Plant.sw
  arrow right from Plant.e
  "$y$" above rjust at Here+(0,2pt__)
  move to last arrow.c 
  line to (Here, 1/4<Obs.se,Obs.ne>)
  arrow to (Obs.e,Here)
] with .nw at PID.sw+(0,-0.5)
  "(b) Output feedback with a full-order observer" below ljust \
   at Observer.sw+(0,-5pt__)

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #

Multiblock: [
boxwid = boxht
circlerad = boxht*0.4

define  summer { circle
  {line from last circle.nw to last circle.se
  line from last circle.sw to last circle.ne
  "$$1$" at last circle.n below
  "$$2$" at last circle.s above
  "$$3$" at last circle.e rjust
  "$$4$" at last circle.w ljust}
}
define doublebox {[box "$$1$"; arrow; box "$$2$"]}

  arrow "$E_1$" above
S1: summer(,-,,+)
  linewid = boxwid/2
  arrow "$\epsilon$" above
  doublebox(H_1,H_2)
  arrow
S2: summer(-,,,+)
  arrow
T: doublebox(H_3,H_4)
  line
Y: Here
  arrow
  "$S_1$" above
R1: box "$R_1$" at (T.x,T.y+boxht*3/2)
  arrow from Y to (Y,R1) then to R1.e
  arrow from R1.w to (S2,R1) then to S2.n
  "$n_1$" ljust at S2.n+(0,boxht/2)
  left
Rf: doublebox(R_2,R_3) at ((S1.x+T.x)/2,T.y-boxht*3/2)
  arrow from T to (T,Rf) then to Rf.e
  arrow from Rf.w to (S1,Rf) then to S1.s
  "$n_2$" at S1.s+(0,-boxht/2) ljust
] with .nw at Observer.sw + (0,-0.5)
  "(c) A multiblock example" below ljust at Multiblock.sw+(0,-5pt__)

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . #

Nonlinear: [boxwid = boxwid*3/2; boxht = boxht*3/2
  thicklines_
  scale = 0.8
  circlerad = 0.3/2
R: box "reference" "$R$"
   arrow right linewid*4/3 "${y_c}_{\hbox{\scriptsize ref}}$" above
Gh: box "```inverse'''" "$\hat G$"
   arrow from Gh.s down "${y_m}_{\hbox{\scriptsize ref}}$" ljust
E: circle
   arrow from E.e right "$e$" above
   box "stabilizer" "$K$"
   arrow "$\delta u$" above
D: circle
   line from Gh.e to (D,Gh.e) "$u_{\hbox{\scriptsize ref}}$" above
   arrow to D.n
   arrow from D.e right "$u$" above
G: box "plant" "$G$"
   arrow <- from G.n up boxht/2 
   "disturbance $z$" above
   arrow right from G.e + (0,boxht/4)
   "$y_c$" ljust
   arrow right from G.e + (0,-boxht/4)
   "$y_m$" ljust
   move to last arrow.c
   arrow down Here.y-G.s.y+boxht*2/3 then left Here.x-E.x then to E.s
   "$-$" at Here + (-0.15,-0.1)
   arrow <- down from R.s
   "$W$ control input" at Here - (0,0.1)

UL:R.nw +(-boxht/2,boxht/2)
UR:(D.e,UL) + (0.1,0)
   line dashed from UL to UR then to (UR,G.s+(0,-boxht*3/2))
   line dashed to (Gh.w,Here) "Controller" above
   line dashed to (Here,Gh.s+(0,-boxht/2))
   line dashed to (UL,Here) then to UL
] with .nw at Multiblock.sw + (0,-0.5)
  "(d) Nonlinear feedforward (for performance) and small-signal feedback (for stability)" \
    below ljust at Nonlinear.sw+(0,-5pt__)

.PE
