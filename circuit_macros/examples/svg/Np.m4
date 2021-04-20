.PS
svg_font(sans-serif,9bp__)

B: box invis wid 6 ht 2
"`nport(box specs; other commands,nw,nn,ne,ns,space ratio,pin lgth,style,other commands)" \
  ljust at B.w \
"" ljust \
"Default is a twoport the size of a normal box." ljust \
"Args 2 to 5 are the number of ports to be drawn on w, n, e, s sides." ljust \
"" ljust \
"The port pins are named by side, number, and by a or b pin," ljust \
"e.g. W1a, W1b, W2a, ... .  Arg 6 specifies the ratio of" ljust \
"port width to interport space, and arg 7 is the pin length." ljust \
"" ljust \
"Set arg 8 to N to omit the dots on the port pins" ljust \
"Arguments 1 and 9 allow customizations'" ljust

svgLink(NportSVG.svg,"&lt;- back" ljust at last box.sw above ljust,B)
command "</g>" # end font
.PE
