.PHONY: help
help:	## Show `make` usage.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: init
init: ## Initializes after first clone. Questionably safe.
	# works for WSL
	.make/init_gitconfig
	# kind of works for WSL. manual actions needed.
	homebrew/install.sh
	# Need to install brewfiles: brew bundle install --file=./macos/Brewfile.symlink
	.make/install
	.make/symlink_dotfiles

.PHONY: install
install: ## Run all install.sh scripts. Questionably safe.
	.make/install

.PHONY: refresh-brewfile
refresh-brewfile:	## Dumps current Brew bundle to Brewfile.
	brew bundle dump --file=~/.Brewfile --force

.PHONY: dotfiles
dotfiles: ## Install dotfiles defined as `*.symlink` files. Safe to run multiple times.
	.make/symlink_dotfiles

.PHONY: clean-broken-symlinks
clean-broken-symlinks: ## Deletes any broken symlinks in the home diretory
	gfind ~ -maxdepth 1 -xtype l -print -delete
