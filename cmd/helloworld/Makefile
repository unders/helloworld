VERSION=0.0.1

.PHONY: help
help:
	@echo ""
	@echo "    make build         # builds docker image: helloworld:$(VERSION)"
	@echo "    make test          # run the tests for the program"
	@echo ""

.PHONY: build
build: test lint
	GOOS=linux GOARCH=amd64 go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"'
	docker build -t helloworld:1.0.0 .
	@rm helloworld
	@docker images helloworld

.PHONY: test
test:
	go test

.PHONY: lint
lint:
	gometalinter \
	--enable-all \
	--deadline=100s \
	--line-length=100 \
	--disable=gas \
	./...



