all:
	pdflatex gretsi.tex
	bibtex gretsi
	pdflatex gretsi.tex
	pdflatex gretsi.tex

clean:
	rm gretsi.log gretsi.out gretsi.aux gretsi.bbl gretsi.blg

