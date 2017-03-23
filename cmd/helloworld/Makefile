VERSION=0.0.2
PROG=helloworld
MAIN_VERSION="main.Version=v$(VERSION)"
BUILDSTAMP="main.Buildstamp=$(shell date -u '+%Y-%m-%dT%I:%M%p')"
GITHASH="main.Githash=$(shell git rev-parse HEAD)"
LDFLAGS=-ldflags "-X $(MAIN_VERSION) -X $(BUILDSTAMP) -X $(GITHASH)"

.PHONY: help
help:
	@echo ""
	@echo "    make build         # builds docker image: $(PROG):$(VERSION)"
	@echo "    make test          # runs the tests for the program"
	@echo "    make lint          # runs the linter on the source code"
	@echo "    make list          # shows $(PROG) containers and images"
	@echo "    make clean         # stops $(PROG); removes its containers and images"
	@echo ""

.PHONY: build
build: test lint
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build $(LDFLAGS)
	@file $(PROG)
	docker build -t $(PROG):$(VERSION) .
	@rm $(PROG)
	@docker images $(PROG)

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

.PHONY: list
list:
	docker ps | grep $(PROG) || true
	docker ps | grep $(PROG) || true
	docker images $(PROG)

.PHONY: clean
clean:
	docker ps -a | grep $(PROG) | awk '{print $$1}' | xargs docker stop
	docker ps -a | grep $(PROG) | awk '{print $$1}' | xargs docker rm
	docker images $(PROG) -q | xargs docker rmi
	docker images | grep none | awk '{print $$3}' | xargs docker rmi
