# Circuit-macros-wrapper
I am a wrapper for the "circuit-macros" library by Dwight Aplevich. I provide a shell script, called `make_circuit.sh`, that given with the m4 circuit description, produces a:

* a tex file with tizk commands that can be either compiled standalone or included in another latex document (with the input command), and
* a pdf drawing of the electric circuit obtained by compiling the tex file.



### Requirements
I was tested under MacOSx with Intel architecture. I should be able to run under Linux, too (`dpic` might need to be recompiled, see below). For Windows, I may possibly work in virtual or emulated enviroments (e.g., CygWin).

* `m4` macro processor (e.g., on Mac OSx, `brew install m4`)
* `pdflatex` to compile the drawing
* This repository also redistributes a pic interpreter, compiled on an Intel MacOSx, and its source code. If you use Linux or a different architecture, you probably need to recompile it.


### Installation
A shell installation script verifies that requirements are satisfied and creates a symbolic link of the shell script in `/usr/local/bin/make_circuit`.
* Download the repository.
* Place the content of the repository in its final folder (e.g., `~/Documents/circuit-macros`), called here INSTALLATION_FOLDER.
* Open a terminal and type:
```
cd INSTALLATION_FOLDER
sh install.sh
```
* If you change the location of the folder after the installation, you need to re-run the installation script.

### Testing
A demo circuit named `RLC.m4` is provided for testing in the folder `INSTALLATION_FOLDER/test`. To test the functionalities, in a terminal give: 
```
cd INSTALLATION_FOLDER
cd test
make_circuit RLC.m4
open RLC.pdf
```
If the compilation process does not return errors and you can see the PDF, then you are good to go! In addition, make_circuit produces a latex file that can be included in a latex document. Look at `make_circuit.sh` for more.


### Practical use
In a terminal, navigate in the folder where you have a circuit m4-file to compile and run:
```
make_circuit RLC.m4
```
Your compiled diagrams will be available in that same folder.


Take a look to https://ece.uwaterloo.ca/~aplevich/Circuit_macros/Circuit_macros.pdf for all the nice features of this excellent package.


### References
* Aplevich, D. (2020). M4 Macros for Electric Circuit Diagrams in LATEX Documents, URL: https://ece.uwaterloo.ca/~aplevich/Circuit_macros/Circuit_macros.pdf
* https://ece.uwaterloo.ca/~aplevich/Circuit_macros/
* https://ctan.org/pkg/circuit-macros?lang=en
