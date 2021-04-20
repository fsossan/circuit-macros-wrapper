.PS
# `Xform.m4'
cct_init

divert(-1)
define(`trlabels',
 `{ thinlines_
    ifelse(`$1',R,
     `arrow from `$3'.P1 <- right 0.12 up 0.072 chop 1pt__ ; "\sl P1" ljust
      arrow from `$3'.P2 <- right 0.12 down 0.072 chop 1pt__ ; "\sl P2" ljust
      arrow from `$3'.TP <- right 0.12 chop 1pt__ ; "\sl TP" wid 0.2 ljust
      arrow from `$3'.S1 <- left 0.12 up 0.072 chop 1pt__ ; "\sl S1" rjust
      arrow from `$3'.S2 <- left 0.12 down 0.072 chop 1pt__ ; "\sl S2" rjust
      arrow from `$3'.TS <- left 0.12 chop 1pt__ ; "\sl TS" rjust
     ',`
      arrow from `$3'.P1 <- left 0.12 up 0.072 chop 1pt__ ; "\sl P1" rjust
      arrow from `$3'.P2 <- left 0.12 down 0.072 chop 1pt__ ; "\sl P2" rjust
      arrow from `$3'.TP <- left 0.12 chop 1pt__ ; "\sl TP" wid 0.2 rjust
      arrow from `$3'.S1 <- right 0.12 up 0.072 chop 1pt__ ; "\sl S1" ljust
      arrow from `$3'.S2 <- right 0.12 down 0.072 chop 1pt__ ; "\sl S2" ljust
      arrow from `$3'.TS <- right 0.12 chop 1pt__ ; "\sl TS" ljust
     ')
    `"'\tt `$2'`"' at `$3'.s+(0,-(`$4'))
  thicklines_ } ')
divert(0)dnl

  down_
  T1: transformer
      trlabels(,`transformer',T1,0.3)
  T2: transformer(down_ 0.6,,2,P,8) with .w at T1.e+(1,0)
      trlabels(,`...(down\_ 0.6,,2,P,8)',T2,0.3)
  T3: transformer(,,8,WD12,4) with .w at T2.e+(1,0)
      trlabels(,`...(,,8,WD12,4)',T3,0.21)
  T4: transformer(,,9,AL) with .sw at T3.se+(1,0)
      trlabels(,`...(,,9,AL)',T4,0.3)
  T5: transformer(,R,8,AW) with .sw at T4.se+(1,0)
      trlabels(R,`...(,R,8,AW)',T5,0.3)

.PE
