PAPER=main

default: paper

paper:
	pdflatex $(PAPER).tex </dev/null
	bibtex $(PAPER)
	pdflatex $(PAPER).tex </dev/null >/dev/null
	pdflatex $(PAPER).tex </dev/null >/dev/null
	pdflatex $(PAPER).tex </dev/null

cont:
	latexmk -pdf -pvc main 

tidy:
	rm -f $(PAPER).aux $(PAPER).bbl $(PAPER).blg $(PAPER).brf $(PAPER).btx $(PAPER).log $(PAPER).out

clean: tidy
	rm -f $(PAPER).pdf

up: update

status:
	-git status

update: status
	-git pull

commit: status
	-git commit -a -m "commit all changes"
	-git push

commiti: status
	-git commit -a
	-git push
