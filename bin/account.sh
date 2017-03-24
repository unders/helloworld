#!/usr/bin/env bash
##
## account creates GCE account and a project
##

create_gce_account() {
    echo ""
    echo "## Create GCE Account"
    echo "    A Google Cloud Platform account is required for"
    echo "    this course. You can use an existing GCP account or"
    echo "    sign up for a new one with a valid Gmail account."
    echo ""
    echo "    * Sign up: https://console.cloud.google.com/freetrial"
    echo "    * Sign in: https://cloud.google.com"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

create_project() {
    echo ""
    echo "## Create a Project"
    echo "    A GCP project is required."
    echo ""
    echo "    * Help: https://support.google.com/cloud/answer/6251787"
    echo "    * Console: https://console.cloud.google.com"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

enable_API() {
    echo ""
    echo "## Enable APIs"
    echo "    Container Engine API must be enabled."
    echo ""
    echo "    * Console: https://console.cloud.google.com"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

main() {
    create_gce_account
    create_project
    enable_API
}

main
