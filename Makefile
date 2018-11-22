## Reveal.js options
THEME = black
TRANSITION = fade

## Location of Pandoc support files.
PREFIX = ~/.pandoc

## Location of your working bibliography file
## Change to the actual folder holding your .bib-file
BIBFOLDER = /Users/joolarjo/.pandoc
BIB = $(BIBFOLDER)/library.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = chicago-author-date
LOCALE = en-EN

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory, except README.md
SRC = $(filter-out README.md, $(wildcard *.$(MEXT)))

## All image files in the subfolder
IMG = $(wildcard img/*)

## All the revealjs-files
REVEALJS=$(SRC:.md=.revealjs.html)

default: revealjs
all:	$(REVEALJS)
revealjs:	$(REVEALJS)

%.revealjs.html: %.md $(IMG)
	pandoc --self-contained -t revealjs --filter pandoc-citeproc --bibliography=$(BIB) --variable=locale:$(LOCALE) --variable=theme:$(THEME) --include-in-header=custom.css --variable=transition:$(TRANSITION) -o $@ $<

.PHONY : clean
clean:
	rm *.revealjs.html
