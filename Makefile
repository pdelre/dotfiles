.PHONY: help
help:	## Show `make` usage.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Run all install.sh scripts. Questionably safe.
	.make/install

.PHONY: refresh-brewfile
refresh-brewfile:	## Dumps current Brew bundle to Brewfile.
	brew bundle dump --file=~/.Brewfile --force

.PHONY: dotfiles
dotfiles: ## Install dotfiles defined as `*.symlink` files. Safe to run multiple times.
	.make/symlink_dotfiles
