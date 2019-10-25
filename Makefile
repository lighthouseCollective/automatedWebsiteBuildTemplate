#  Makefile
#  Lighthouse Collective
#  Authored on   October 25, 2019
#  Last Modified October 25, 2019

#
#	 Contains automated scripts for building the Neffli Website
#


#  Use terminal command 'make build' to construct website
#  Find the finished product within the _build folder.
build: index css


BEGIN_HTML = cat src/std/stdh.html > 
BEGIN_BODY = printf "  </head>\n  <body>\n" >>
STD_BODYb  = for file in ls src/std/*b.html ; do cat $$file >>
STD_BODYe  = ; done 
 
END_HTML   = printf "\n  </body>\n</html>\n" >>


index:
	mkdir -p _build
	${BEGIN_HTML} _build/index.html
	${BEGIN_BODY} _build/index.html
	cat src/indexb.html >> _build/index.html
	${STD_BODYb} _build/index.html ${STD_BODYe}
	${END_HTML} _build/index.html


css:
	cp src/std/core.css _build


tidy: 
	rm -rf _build
