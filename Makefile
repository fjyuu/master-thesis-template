filename:=thesis

.PHONY: all clean

all:
	platex -shell-escape $(filename).tex
	pbibtex $(filename).aux
	platex $(filename).tex
	platex $(filename).tex
	dvipdfmx $(filename).dvi

clean:
	@rm -f $(filename).pdf *.aux *.dvi *.log *.nav *.out *.snm *.toc *.xbb *.lof *.lot *.thm *.bbl *.blg
