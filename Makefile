.PHONY: help refresh-brewfile

help:	## Show `make` usage.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

refresh-brewfile:	## Dumps current Brew bundle to Brewfile.
	brew bundle dump --file=~/.Brewfile --force
