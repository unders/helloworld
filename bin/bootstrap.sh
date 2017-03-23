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
        echo "  - Go                        [ Installed ]"
        return
    fi

    echo "  - Go                        [ --------- ]"
    echo ""
    echo "## How to install Go"
    echo "  - See: https://golang.org/dl/"
    echo "  - Installing Go 1.8"
    echo ""
    echo "      cd /tmp"
    echo "      wget https://storage.googleapis.com/golang/go1.8.darwin-amd64.tar.gz"
    echo "      tar -C /usr/local -xzf go1.8.darwin-amd64.tar.gz"
    echo "      go version"
    echo ""
    exit 0
}

docker_is_required() {
    if command_exists docker; then
        echo "  - Docker                    [ Installed ]"
        return
    fi

    echo "  - Docker                    [ --------- ]"
    echo ""
    echo "## How to install Docker"
    echo "  - See: https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac"
    echo ""
    exit 0
}

python_is_required() {
    if command_exists python; then
        echo "  - Python                    [ Installed ]"
        return
    fi


    echo "  - Python                    [ --------- ]"
    echo ""
    echo "## How to install Python 2.7"
    echo "  - see: https://www.python.org/downloads/release/python-2713/"
    echo ""
    exit 0
}

gcp_sdk_is_required() {
    if command_exists gcloud; then
        echo "  - Google Cloud Platform SDK [ Installed ]"
        echo ""
        echo "## Updating Google Cloud Platform SDK"
        gcloud components update
        gcloud components install kubectl
        return
    fi

    echo "  - Google Cloud Platform SDK [ --------- ]"
    echo ""
    echo "## How to install Google Cloud Platform SDK"
    echo "  - See: https://cloud.google.com/sdk/docs/quickstart-mac-os-x"
    echo ""
    exit 0
}


main() {
    echo ""
    echo "## Checking dependencies"
    go_is_required
    docker_is_required
    python_is_required
    gcp_sdk_is_required
    echo ""
    echo "## Success"
    echo "  - Required dependencies are installed"
    echo ""
}

main
