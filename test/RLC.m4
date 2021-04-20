.PS
# Read in macro definitions and set defaults
cct_init
# Variables are allowed; default units are inches
elen = 1
# Position names are capitalized
Origin: Here
source(up_ elen); llabel(-,v_s,+)
resistor(right_ elen);  rlabel(,R,)
dot
{
  # Save the current position and direction
  capacitor(down_ to (Here,Origin))
  #(Here,Origin) = (Here.x,Origin.y)
  rlabel(+,v,-); llabel(,C,)
  dot
}
# Restore former position and direction
line right_ elen*2/3
inductor(down_ Here.y-Origin.y); rlabel(,L,); b_current(i)
line to Origin
.PE
