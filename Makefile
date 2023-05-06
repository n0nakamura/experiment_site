SRCDIR := content
SOURCE := $(wildcard $(SRCDIR)/*.adoc)
TRGDIR := docs

FILENAME := $(shell ./nnulidgen)

.PHONY: new
new:
	cp template/default.adoc content/$(FILENAME).adoc
	sed -i -E "/bloglist/s/$$/\n        <li class=\"listitem\"><span class=\"ulid\">$(FILENAME)<\/span> <a href=\"$(FILENAME)\" target=\"_top\"><\/a><\/li>/g" $(TRGDIR)/index.html

.PHONY: html
html:
	$(foreach file, $(SOURCE), asciidoctor $(file) -o $(TRGDIR)/$(notdir $(basename $(file))).html;)

.PHONY: clean
clean:
	rm $(TRGDIR)/*.html
