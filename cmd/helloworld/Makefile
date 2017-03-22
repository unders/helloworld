VERSION=0.0.2
V_VERSION=$(VERSION)
MAIN_VERSION="main.Version=$(V_VERSION)"
BUILDSTAMP="main.Buildstamp=$(shell date -u '+%Y-%m-%dT%I:%M%p')"
GIT_HASH="main.Githash=$(shell git rev-parse HEAD)"
LDFLAGSX=-ldflags "-X $(MAIN_VERSION) -X $(BUILDSTAMP) -X $(GIT_HASH)"
LDFLAGS=--ldflags '-extldflags "-lm -lstdc++ -static"'

.PHONY: help
help:
	@echo ""
	@echo "    make build         # builds docker image: helloworld:$(VERSION)"
	@echo "    make test          # run the tests for the program"
	@echo "    make lint          # run the linter on the source code"
	@echo ""

.PHONY: build
build: test lint
	GOOS=linux GOARCH=amd64 go build --tags netgo $(LDFLAGS) $(LDFLAGSX)
	docker build -t helloworld:$(VERSION) .
	@rm helloworld
	@docker images helloworld

.PHONY: test
test:
	@go test

.PHONY: lint
lint:
	gometalinter \
	--enable-all \
	--deadline=100s \
	--line-length=100 \
	--disable=gas \
	./...



