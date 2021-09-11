-include .env

.DEFAULT_GOAL := help

help: ## This help command. Anything prepended with a double hash will be displayed to the CLI user
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-21s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

%:
	@exit 0

##----------------------------------------------------------------------------------------------------------------------
##@ Development

build: ## Builds Node images & install dependencies
	@docker-compose build

dev: build ## Start a serverless development environment
	@docker-compose up

debug: build ## Start a serverless development environment
	@docker-compose run --rm -e SLS_DEBUG=* app

sh:
	@docker-compose run --rm app sh

test-unit:
	@docker-compose run --rm app yarn test

format:
	@docker-compose run --rm app yarn format

