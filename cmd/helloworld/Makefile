VERSION=0.0.2
PROG=helloworld
IMAGE=$(PROG):$(VERSION)
MAIN_VERSION="main.Version=v$(VERSION)"
BUILDSTAMP="main.Buildstamp=$(shell date -u '+%Y-%m-%dT%I:%M%p')"
GITHASH="main.Githash=$(shell git rev-parse HEAD)"
LDFLAGS=-ldflags "-X $(MAIN_VERSION) -X $(BUILDSTAMP) -X $(GITHASH)"

http?=":10080"
httpAddr=$(http)
httpPort=$(shell echo "$(http)" | sed 's/\://g')
health?=":10081"

.PHONY: help
help:
	@echo ""
	@echo "** $(PROG) v$(VERSION)"
	@echo ""
	@echo "Commands:"
	@echo "    make build         # builds a docker image"
	@echo "    make test          # runs the tests"
	@echo "    make lint          # runs a linter on the source code"
	@echo "    make list          # shows containers and images"
	@echo "    make start         # starts container"
	@echo "    make stop          # stops container"
	@echo "    make run           # runs the go binary"
	@echo "    make log           # show log for running container"
	@echo "    make tail          # tails log for running container"
	@echo "    make check         # do requests against the running container"
	@echo "    make clean         # stops the container and removes it and its image"
	@echo ""
	@echo "Args (start, run, check):"
	@echo "    http               # http=:10180"
	@echo "    health             # health=:10181"
	@echo ""
	@echo "Examples:"
	@echo "    make start"
	@echo "    http=:10180 health=:10181 make start"
	@echo "    http=:10180 health=:10181 make check"
	@echo "    http=:10180 health=:10181 make run"
	@echo ""

.PHONY: build
build: test lint
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build $(LDFLAGS)
	@file $(PROG)
	docker build -t $(IMAGE) .
	@rm $(PROG)
	@docker images $(IMAGE)

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
	docker ps -a | grep $(PROG) || true
	docker images $(PROG)

.PHONY: start
start:
	docker run -p $(httpPort):80 --name $(PROG) -d $(IMAGE)
	docker ps -l | grep $(IMAGE) | awk '{print $$1}' | xargs docker logs

.PHONY: stop
stop:
	docker ps | grep $(PROG) | awk '{print $$1}' | xargs docker stop
	docker ps -al | grep $(IMAGE) | awk '{print $$1}' | xargs docker logs --tail 20
	@docker ps -a  | grep $(IMAGE) | awk '{print $$1}' | xargs docker rm

.PHONY: run
run:
	go install && $(PROG) -http=$(httpAddr)

.PHONY: log
log:
	docker ps -al | grep $(IMAGE) | awk '{print $$1}' | xargs docker logs

.PHONY: tail
tail:
	docker ps -al | grep $(IMAGE) | awk '{print $$1}' | xargs docker logs -f --tail 10

.PHONY: check
check:
	curl http://localhost:$(httpPort)

.PHONY: clean
clean:
	docker ps -a | grep $(PROG) | awk '{print $$1}' | xargs docker stop
	docker ps -a | grep $(PROG) | awk '{print $$1}' | xargs docker rm
	docker images $(PROG) -q | xargs docker rmi
	docker images | grep none | awk '{print $$3}' | xargs docker rmi
