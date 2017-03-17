.PHONY: help
help:
	@cat Makefile

.PHONY: install
install:
	@go install github.com/unders/helloworld

.PHONY: run
run: install
	@helloworld

.PHONY: push
push:
	@git push
