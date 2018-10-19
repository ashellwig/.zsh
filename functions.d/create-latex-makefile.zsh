# Title: create-latex-makefile.zsh
# Author: Ashton S. Hellwig <ahellwig.dev@gmail.com>
# Usage: Type command "create-latex-makefile" in a terminal
# Discription: Creates a Makefile for compiling latex to PDF with latexmk
#  and to HTML with make4ht

create-latex-makefile() {
	# Function to create the Makefile itself
	touch-latex-makefile() {
		cat << 'EOF' > ./Makefile
# Variables
RM=rm -rf

LATEXMK= \
	latexmk -pdf \
	-pdflatex="pdflatex -interaction=nonstopmode" \
	-use-make

MAKE4HT= \
	make4ht \
	main.tex \
	",charset=utf-8" "-cunihtf -utf8" \
	"" \
	"-interaction=nonstopmode"

PDFVIEWER=/usr/bin/google-chrome-stable

# Build Commands
.PHONY: Main.pdf Main.html all clean
all: Main.pdf Main.html clean
view-all: viewpdf viewhtml
clean-all: clean clean-everything
pdf: Main.pdf clean
html: Main.html clean

# Building
Main.pdf: main.tex
	$(LATEXMK) $<
	biber main
	$(LATEXMK) $<
	$(LATEXMK) $<

Main.html: main.tex
	$(MAKE4HT)
	biber main
	$(MAKE4HT)
	$(MAKE4HT)

# Viewing
viewpdf: Main.pdf
	$(PDFVIEWER) ./main.pdf

viewhtml: Main.html
	$(PDFVIEWER) ./main.html

# Cleaning
clean:
	latexmk -c
	$(RM) *.4tc
	$(RM) *.4ct
	$(RM) *.tmp
	$(RM) *.xref
	$(RM) *.idv
	$(RM) *.lg
	$(RM) *.out.ps
	$(RM) *.bbl
	$(RM) *.bib.bbl
	$(RM) *.bib.blg
	$(RM) *.run.xml
	$(RM) *.dvi
	$(RM) *.lol

clean-everything: clean
	latexmk -CA
	$(RM) *.html
	$(RM) *.css
	$(RM) *.out.ps
	$(RM) *.bbl
	$(RM) *.bib.bbl
	$(RM) *.bib.blg
	$(RM) *.run.xml
EOF
	}

	# Check if there is a Makefile already
	if [[ -e ./Makefile ]] || [[ -e ./makefile ]]; then
		echo -e "\033[31m./Makefile already exists.\n\033[0m "
		read -q "REPLY?Overwrite? [yn]: "
		echo
		if [[ "$REPLY" =~ ^[Yy]$ ]]; then
			mv ./Makefile ./Makefile.bak
		else
			echo -e "\033[31mOperations canceled by user.\n\033[0m"
			return 1
		fi
	else
		touch-latex-makefile
		echo -e "\033[32mDone.\n\033[0m"
	fi
}
