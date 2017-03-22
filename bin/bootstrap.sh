#!/usr/bin/env bash
##
## bootstrap checks that required dependencies are installed:
##
##        * Go
##        * Docker
##        * Google Cloud Platform
##        * Python 2.7
##        * Bazel
##        * Java JDK8
##

command_exists () {
    type "$1" &> /dev/null ;
}

java_jdk8_is_required() {
    if command_exists java; then
        return
    fi

    echo ""
    echo "You must install Java JDK 8:"
    echo "    http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
    echo "    Look for 'Mac OS X x64' under 'Java SE Development Kit'"
    echo "    This will download a DMG image with an install wizard."
    echo ""
}

bazel_is_required() {
    if command_exists bazel; then
        return
    fi

    echo ""
    echo "Installing Bazel:"
    echo "    https://bazel.build/versions/master/docs/install.html#mac-os-x"
    brew install bazel
    echo ""
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
    java_jdk8_is_required
    bazel_is_required
    go_is_required
    docker_is_required
    python_is_required
    gcp_sdk_is_required
}

main
