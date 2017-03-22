.PHONY: help
help:
	@cat Makefile

.PHONY: bootstrap
bootstrap:
	@./bin/bootstrap.sh

.PHONY: install
install:
	@go install github.com/unders/helloworld

.PHONY: run
run: install
	@helloworld

.PHONY: push
push:
	@git push
