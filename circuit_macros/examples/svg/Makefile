LIBDIR = $$HOME/lib
M4LIBS = svg.m4 SVGconfig.m4
M4LIBS = svg.m4
M4 = m4
# PDFCONVERT = pdf2svg
PDFCONVERT = dvisvgm

# To process a single file, copy it to test.m4 and type "make tst"
# to produce tstSVG.html

DPIC = dpic
#DPIC = $$HOME/dpic/pascal/p2c/ftp/dpic
#DPIC = ../../../dpic/pascal/p2c/ftp/dpic
#DPIC = ../../../dpic/bison/dpic
#DPIC = ../../../dpic/bi*dev/dpic

# To test the Windows executable.  Change these as needed for the operating
# system.  NOTE: AntiqueClockSVG.m4 and Connectors.m4 use awk and sed which
# do not work at present with the Windows version.
# M4LIBS = svg.m4 windows.m4
# DPIC = ../../../dpic/bison/distsrc/Windows/dpic

.SUFFIXES: .pic .svg .m4 .xsvg
.pic.svg:
	$(DPIC) -v $*.pic > $*.svg
	grep '<\!-- width' $*.svg | sed -e 's%<\!-- *%%' -e 's% *-->%%' > $*.siz
.m4.svg:
	m4 $(M4LIBS) $*.m4 | sed -e '/^\%/d' > $*.pic
	$(DPIC) -v $*.pic > $*.svg
	grep '<\!-- width' $*.svg | sed -e 's%<\!-- *%%' -e 's% *-->%%' > $*.siz
.m4.xsvg:
	touch F_$*.dim
	$(M4) pgf.m4 F_$*.dim $*.m4 > $*.pic
	$(DPIC) -g $*.pic >> $*.tex
	echo "\documentclass[crop,tikz,multi=false]{standalone}" > F_$*.tex
	echo "\usepackage{boxdims,siunitx,amssymb}" >> F_$*.tex
	echo "\begin{document}" >> F_$*.tex
	echo "\input $*.tex" >> F_$*.tex
	echo "\end{document}" >> F_$*.tex
	pdflatex --quiet F_$*
	$(M4) pgf.m4 F_$*.dim $*.m4 > $*.pic
	$(DPIC) -g $*.pic >> $*.tex
	pdflatex --quiet F_$*
	if test "$(PDFCONVERT)" = "pdf2svg" ; then \
      pdf2svg F_$*.pdf $*.xsvg && cp $*.xsvg $*.svg ; \
    else \
      dvisvgm --pdf F_$*.pdf && mv F_$**.svg $*.svg ; cp $*.svg $*.xsvg ; \
      fi
	rm -f F_$**

CCTSVG = \
 AdderSVG.svg AlogixSVG.svg ABlogixSVG.svg AmpTableSVG.svg AntennasSVG.svg \
 AntiqueClockSVG.svg \ AudioSVG.svg \
 BipSVG.svg BtreeSVG.svg ByteSVG.svg ButtonsSVG.svg \
 CanLogicSVG.svg CctTableSVG.svg ConnSVG.svg ConnectorsSVG.svg \
 ContactSVG.svg ContactsSVG.svg \
 CountingSVG.svg CrossbarSVG.svg CrowSVG.svg CsourceSVG.svg \
 DecoderSVG.svg DemultiplexerSVG.svg DiniSVG.svg DiodesSVG.svg DriveSVG.svg \
 EmarrowsSVG.svg \
 FlowSVG.svg FontsSVG.svg FusesSVG.svg \
 GeometrySVG.svg GrayCodeSVG.svg GroundsSVG.svg \
 HeadersSVG.svg HeathkitSVG.svg InclepsSVG.svg I2LSVG.svg JackSVG.svg \
 LyapSVG.svg LogicSVG.svg LoglogSVG.svg \
 MCSVG.svg MixerSVG.svg MotorControlSVG.svg MultiplexerSVG.svg \
 NLGSVG.svg NPDTSVG.svg NportSVG.svg OpampSVG.svg OptoisoSVG.svg \
 PconnSVG.svg PushPullSVG.svg QuantumSVG.svg \
 RectifiersSVG.svg RelaySVG.svg RotboxSVG.svg\
 SchottkySVG.svg ShiftRSVG.svg SierpinskiSVG.svg \
 SixpoleSVG.svg SourcesSVG.svg SQUIDSVG.svg SwitchesSVG.svg \
 TTLnandSVG.svg TgateSVG.svg ThreeSVG.svg \
 TubediagsSVG.svg VariableSVG.svg WindingsSVG.svg XformSVG.svg \
 controlSVG.svg cscSVG.svg diamondSVG.svg ex00SVG.svg \
 ex01SVG.svg ex02SVG.svg ex03SVG.svg ex04SVG.svg ex05SVG.svg ex06SVG.svg \
 ex08SVG.svg ex09SVG.svg ex10SVG.svg ex11SVG.svg ex12SVG.svg \
 ex15SVG.svg ex16SVG.svg ex17SVG.svg ex18SVG.svg ex21SVG.svg \
 expSVG.svg fetSVG.svg graysurfSVG.svg lcctSVG.svg \
 pwrsupplySVG.svg quickSVG.svg randomSVG.svg recycleSVG.svg relaycoilSVG.svg \
 roseSVG.svg sfgSVG.svg shapesSVG.svg paletteSVG.svg \
 thyristorSVG.svg ujtSVG.svg UNOSVG.svg wormSVG.svg XORSVG.svg Np.svg \
 Y14-5SVG.svg

examplesSVG.html: examplesSVG.htmx
	cp ../quick.m4 .
	make $(CCTSVG) quick.xsvg
	Version=`sed -e 's/Version //' $(LIBDIR)/doc/Version.tex` ; \
      sed -e 's/Version XXX/Version '$$Version'/' examplesSVG.htmx \
      | m4 > examplesSVG.html

SED = sed -e '/^\%/d'
TEST = test
tst:
	if test -f test.pic; then printf "\n\nUsage: make clean tst\n\n"; exit 1; fi
	m4 $(M4LIBS) test.m4 | $(SED) > test.pic
	$(DPIC) -v $(TEST).pic > $(TEST).svg
	m4 $(M4LIBS) $(TEST).m4 | $(SED) > $(TEST).pic
	$(DPIC) -v $(TEST).pic > $(TEST).svg
	grep '<\!-- width' $(TEST).svg | sed -e 's%<\!-- *%%' -e 's% *-->%%' \
     > $(TEST).siz
	make tstSVG.html

test.pic:
	if test -f test.pic ; then echo "Usage: make clean tst" ; fi
	m4 $(M4LIBS) test.m4 | $(SED) > test.pic
	m4 $(M4LIBS) test.m4 | $(SED) > test.pic

tstSVG.html: tstSVG.htmx $(TEST).svg
	Version=`sed -e 's/Version //' $(LIBDIR)/doc/Version.tex` ; \
      sed -e 's/Version XXX/Version '$$Version'/' \
          -e 's/XXXXX/'$(TEST)'/g' \
      tstSVG.htmx | m4 > tstSVG.html
#	cp tstSVG.html $(TEST) $$HOME/public_html/svg

xst: Incleps.png

AntiqueClockSVG.svg ConnectorsSVG.svg:
	m4 $(M4LIBS) $*.m4 | sed -e '/^\%/d' > $*.pic
	$(DPIC) -v $*.pic > $*.svg
	m4 $(M4LIBS) $*.m4 | sed -e '/^\%/d' > $*.pic
	$(DPIC) -v $*.pic > $*.svg
	grep '<\!-- width' $*.svg | sed -e 's%<\!-- *%%' -e 's% *-->%%' > $*.siz

xntiqueClockSVG.svg:
	m4 $(M4LIBS) AntiqueClockSVG.m4 | sed -e '/^\%/d' > AntiqueClockSVG.pic
	$(DPIC) -v AntiqueClockSVG.pic > AntiqueClockSVG.svg
	m4 $(M4LIBS) AntiqueClockSVG.m4 | sed -e '/^\%/d' > AntiqueClockSVG.pic
	$(DPIC) -v AntiqueClockSVG.pic > AntiqueClockSVG.svg
	grep '<\!-- width' AntiqueClockSVG.svg | sed -e 's%<\!-- *%%' -e 's% *-->%%' > AntiqueClockSVG.siz

InclepsSVG.svg: InclepsSVG.m4
	m4 $(M4LIBS) $*.m4 | sed -e '/^\%/d' > $*.pic
	$(DPIC) -v $*.pic > $*.svg
	$(DPIC) -v $*.pic > $*.svg

Incleps.png:
	(cd ..; make Incleps.png); cp ../Incleps.png .

clean:
	@printf "\n svg clean:\n"
	rm -f *.svg *.dim *.ps *log *.siz *.pic examplesSVG.html Incleps.png
	rm -f tstSVG.html copy_tmp__ quick.m4 quick.xsvg
	rm -f *.otf xx* *png *.pdf *.css *.xml quick.tex
	@printf "\n"

clobber: clean
	(cd dev; make clobber)
	rm -f test.m4
