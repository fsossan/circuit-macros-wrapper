#!/bin/bash
CMPATH="/Users/fabrizio.sossan/Documents/circuit_macros"


fname=$(echo "$1" | cut -f 1 -d '.')

m4 -I $CMPATH/circuit_macros pgf.m4 $1 > $fname.pic
if [ ! $? -eq 0 ]; then
  echo "Could not create pic file."
  exit 1
fi

$CMPATH/dpic/dpic -g $fname.pic > $fname.tex
if [ ! $? -eq 0 ]; then
  echo "Could not create tikz tex file."
  exit 1
fi
rm $fname.pic

# This is a for removing a line that i cannot understand where it comes from!
#sed -i 's/[\]psset{noCurrentPoint}/ /g' $1.tex

cat $CMPATH/standalone/opening.tex $fname.tex $CMPATH/standalone/closing.tex > ${fname}_temp.tex
if [ ! $? -eq 0 ]; then
  echo "Could not concatenate file."
  exit 1
fi
mv ${fname}_temp.tex ${fname}.tex

pdflatex $fname.tex
if [ ! $? -eq 0 ]; then
  echo "Could not compile the final pdf file"
  exit 1
fi

echo ""
echo "***"
echo "ALL GOOD. Your circuit should be ready in $fname.pdf and in $fname.tex if you wish to include in an existing latex document."
echo "***"

# cleaning up latex rubbish
rm $fname.aux $fname.log
