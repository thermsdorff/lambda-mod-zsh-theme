makefile := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
SHELL := /bin/zsh
AWK := $(shell command -v awk 2> /dev/null)
.DEFAULT_GOAL := help
.PHONY: help

help:
ifndef AWK
				@fgrep -h "##" $(makefile) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
else
				@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(makefile) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
endif

##
## Usage
##-----------------------------------------------------------------------------
install: ## Install ZSH theme and source zshrc
			 cp ./lambda-mod.zsh-theme /home/${USER}/.oh-my-zsh/themes/
.PHONY: install
