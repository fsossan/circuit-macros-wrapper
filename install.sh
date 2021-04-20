#!/bin/bash

which m4 &> /dev/null
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "You need the m4 processor"
		exit 1
fi
echo "m4 processor: OK"

which pdflatex &> /dev/null
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "You need pdflatex"
		exit 1
fi
echo "pdflatex processor: OK"


curdir=`pwd`


sed "s#\(CMPATH=\"\)\(.*\)\(\"\)#\1$curdir\3#" make_circuit.sh > temp.txt
mv temp.txt make_circuit.sh


rm -f test/RLC.tex
rm -f test/RLC.pdf

rm -f /usr/local/bin/make_circuit
ln -s $curdir/make_circuit.sh /usr/local/bin/make_circuit
chmod +x /usr/local/bin/make_circuit

echo "     "
echo "OK. Done."
echo "Navigate to the folder test (cd test) and run make_circuit RLC.m4 for a test."
