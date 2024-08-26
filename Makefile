all: publications
	@quarto render

publications: pubs.bib apa-cv.csl lua-refs.lua
	@quarto pandoc -L lua-refs.lua \
		pubs.bib --csl=apa-cv.csl \
		-V --toc=false \
		--to=markdown-citations \
		-o pubs.qmd
	@Rscript highlight-author.R \
		"Wang, J." "pub.qmd"

clean:
	rm -rf publications* *~
