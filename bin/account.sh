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

login() {
    echo ""
    echo "## Login to Google Cloud Platform"
    echo ""
    echo "Write:"
    echo "        gcloud auth login"
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
    echo "Write:"
    echo "       gcloud projects create --name="helloworld" --set-as-default"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

enable_API() {
    echo ""
    echo "## Enable Billing and APIs for this project"
    echo "    - Enable billing"
    echo "    - Container Engine API must be enabled."
    echo ""
    echo "    * Console: https://console.cloud.google.com"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}



create_configuration() {
    echo ""
    echo "## Create configuration"
    echo ""
    echo "Write:"
    echo "        gcloud init"
    echo ""
    echo "Useful Commands:"
    echo ""
    echo "        gcloud topic configurations        # show information about configuration"
    echo "        gcloud config list                 # lists active configuration"
    echo "        gcloud config configurations list  # list available configurations"
    echo "        gcloud config configurations --help"
    echo "        gcloud info"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

create_kubernetes_cluster() {
    echo ""
    echo "## Create Container cluster"
    echo ""
    echo "Write:"
    echo "        gcloud container clusters create k0"
    echo ""
    echo "Useful Commands:"
    echo ""
    echo "        gcloud container clusters list"
    echo "        kubectl config view"
    echo "        kubectl --help"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

main() {
    create_gce_account
    login
    create_project
    enable_API
    create_configuration
    create_kubernetes_cluster
}

main
