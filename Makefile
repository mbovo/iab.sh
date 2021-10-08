THEME_VERSION := v0.8.2
THEME := hugo-geekdoc
BASEDIR := .
THEMEDIR := $(BASEDIR)/themes

.PHONY: all
all: assets build

.PHONY: assets
assets:
	mkdir -p $(THEMEDIR)/$(THEME)/ ; \
	curl -sSL "https://github.com/thegeeklab/$(THEME)/releases/download/${THEME_VERSION}/$(THEME).tar.gz" | tar -xz -C $(THEMEDIR)/$(THEME)/ --strip-components=1

.PHONY: build
build:
	cd $(BASEDIR); hugo

.PHONY: clean
clean:
	rm -rf $(THEMEDIR) && \
	rm -rf $(BASEDIR)/public