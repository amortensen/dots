# Copied from Carsten Bormann's kramdown-rfc tutorial
#
OPEN=$(word 1, $(wildcard /usr/bin/xdg-open /usr/bin/open /bin/echo))
SOURCES?=${wildcard *.mkd}
DRAFTS=${SOURCES:.mkd=.txt}
HTML=${SOURCES:.mkd=.html}

all:    $(DRAFTS)

html:   $(HTML)

%.xml:  %.mkd
	kramdown-rfc2629 $< >$@.new
	mv $@.new $@

%.html: %.xml
	xml2rfc --html $<
	$(OPEN) $@

%.txt:  %.xml
	xml2rfc  $< $@
