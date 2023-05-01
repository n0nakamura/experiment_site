SRCDIR := content
SOURCE := $(wildcard $(SRCDIR)/*.adoc)
TRGDIR := docs


.PHONY: html
html:
	$(foreach file, $(SOURCE), asciidoctor $(file) -o $(TRGDIR)/$(notdir $(basename $(file))).html;)

.PHONY: clean
clean:
	rm $(TRGDIR)/*.html

.PHONY: new
new:
	cp template/default.adoc content/`./nnulidgen`.adoc
