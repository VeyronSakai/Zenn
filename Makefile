.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'	

.PHONY: init
init: node_moduels books articles ## Initialize project

.PHONY: article
article: node_moduels articles ## Create new article
	npx zenn new:article

.PHONY: book
book: node_moduels books ## Create new book
	npx zenn new:book

node_moduels: package.json package-lock.json
	npm install

.PHONY: clean
clean: ## Remove node_modules
	rm -rf node_modules

package.json:
	npm init -yes
	npm install zenn-cli

articles: node_moduels
	npx zenn init

books: node_moduels
	npx zenn init

.PHONY: preview
preview: node_moduels ## Preview
	npx zenn preview
