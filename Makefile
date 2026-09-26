VERSION=$(shell jq -r .version package.json)
DATE=2025-08-20

SITE_URL = https://nexustar.github.io/the-monospace-web-cjk/
LANGS = zh-Hans zh-Hant ja ko
PAGES = index.html $(LANGS:%=index.%.html)
PANDOC = pandoc -f markdown+east_asian_line_breaks --toc -s --css src/reset.css --css src/index.css -Vversion=v$(VERSION) -Vdate=$(DATE) -Vsite-url=$(SITE_URL) --template=demo/template.html

all: $(PAGES)

clean:
	rm -f $(PAGES)

index.html: demo/index.md demo/template.html Makefile
	$(PANDOC) -Vpage-en -i $< -o $@

index.%.html: demo/index.%.md demo/template.html Makefile
	$(PANDOC) -Vpage-$* -i $< -o $@

.PHONY: all clean
