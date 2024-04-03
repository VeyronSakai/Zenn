.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'	

.PHONY: init
init: node_modules books articles ## Initialize project

.PHONY: article
article: node_modules articles ## Create new article
	@npx zenn new:article
	@rm -f articles/.keep

.PHONY: book
book: node_modules books ## Create new book
	@npx zenn new:book
	@rm -f books/.keep

.PHONY: preview
preview: node_modules ## Preview
	@npx zenn preview

.PHONY: clean
clean: ## Remove node_modules
	@rm -rf node_modules

node_modules: package.json package-lock.json
	@if [ ! -d "node_modules" ]; then \
		npm install; \
	fi

package.json:
	@if [ ! -f "package.json" ]; then \
		npm init -yes; \
		npm install zenn-cli \
	fi

articles: node_modules
	@if [ ! -d "articles" ]; then \
		npx zenn init; \
	fi

books: node_moduels
	@if [ ! -d "books" ]; then \
		npx zenn init; \
	fi
