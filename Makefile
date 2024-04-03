.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'	

.PHONY: article
article: node_moduels ## Create new empty article
	npx zenn new:article

node_moduels: package.json package-lock.json
	npm install

.PHONY: clean
clean: ## Remove node_modules
	rm -rf node_modules

package.json:
	npm init -yes
	npm install zenn-cli

.PHONY: init
init: node_moduels ## Initialize project
