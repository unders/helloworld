#!/usr/bin/env bash

deploy_nginx() {
    echo ""
    echo "## Deploy nginx"
    echo ""
    echo "    kubectl run nginx --image=nginx:1.10.0"
    echo "    kubectl get pods"
    echo "    gcloud compute instances list"
    echo "    kubectl get services"
    echo "    kubectl expose deployment nginx --port 80 --type LoadBalancer"
    echo "    kubectl get services"
    echo "    curl -I EXTERNAL-IP"
    echo "    curl EXTERNAL-IP"
    echo ""
    read -n 1 -p "[ Enter ] " input
    echo ""
}

main() {
    deploy_nginx
}

main