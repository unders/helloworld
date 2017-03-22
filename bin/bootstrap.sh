#!/usr/bin/env bash
##
## bootstrap checks that required dependencies are installed:
##
##        * Go
##        * Docker
##        * Google Cloud Platform
##        * Python 2.7
##

command_exists () {
    type "$1" &> /dev/null ;
}


go_is_required() {
    if command_exists go; then
        return
    fi

    echo ""
    echo "You must install Go:"
    echo "    https://golang.org/dl/"
    echo "    cd /tmp"
    echo "    wget https://storage.googleapis.com/golang/go1.8.darwin-amd64.tar.gz"
    echo "    tar -C /usr/local -xzf go1.8.darwin-amd64.tar.gz"
    echo "    go version"
    echo ""
    exit 0
}

docker_is_required() {
    if command_exists docker; then
        return
    fi

    echo ""
    echo "You must install Docker:"
    echo "    https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac"
    echo ""
    exit 0
}

python_is_required() {
    if command_exists python; then
        return
    fi

    echo ""
    echo "You must install: python 2.7"
    echo ""
    exit 0
}

gcp_sdk_is_required() {
    if command_exists gcloud; then
        gcloud components update
        gcloud components install kubectl
        return
    fi

    echo ""
    echo "Install Google Cloud Platform SDK:"
    echo "   https://cloud.google.com/sdk/docs/quickstart-mac-os-x"
    echo ""
    exit 0
}


main() {
    go_is_required
    docker_is_required
    python_is_required
    gcp_sdk_is_required
}

main
