TEX = $(wildcard *.tex)
DVI = $(TEX:.tex=.dvi) 
PDF = $(TEX:.tex=.pdf)
COMPILER = latexmk
VIEWER = evince

.PHONY: compile_main view all clean
compile_main: main.pdf

view: main.pdf
	$(VIEWER) main.pdf
	
all: $(PDF)

%.pdf: %.dvi
	$(COMPILER) -pdfdvi $<

%.dvi: %.tex
	$(COMPILER) $<

clean:
	$(RM) $(PDF) *.dvi *.log *.aux *.fdb_latexmk *.synctex.gz
