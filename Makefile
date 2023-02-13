XSLFILE := /usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/docbook.xsl
SRCDIR := content
SOURCE := $(wildcard $(SRCDIR)/*.docbook)
TRGDIR := docs

.PHONY: html clean

html:
	$(foreach file, $(SOURCE), xsltproc $(XSLFILE) $(file) > $(TRGDIR)/$(notdir $(basename $(file))).html && xmllint --html --encode utf-8 --format $(TRGDIR)/$(notdir $(basename $(file))).html --output $(TRGDIR)/$(notdir $(basename $(file))).html;)
clean:
	rm $(TRGDIR)/*.html
new:
	cp template/default.docbook content/`./nnulidgen`.docbook
