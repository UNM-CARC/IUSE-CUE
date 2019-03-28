PARTPDFS = todo.pdf support.pdf facilities.pdf personnel.pdf
GENPDFS = description.pdf data-mgmt.pdf ${PARTPDFS}

.SILENT:
.PHONY: all clean

all: proposal.pdf

proposal.pdf: ${GENPDFS}

${GENPDFS}: includes.tex

%.pdf: %.tex
	latexmk -pdf $<

description.pdf: description.tex $(shell ls description/*.tex)
	latexmk -pdf description.tex

clean:
	latexmk -C -f ${GENPDFS}
