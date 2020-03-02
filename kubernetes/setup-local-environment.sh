#!/usr/bin/env bash
# This script will create a local Kubernetes development environment when running 
# Kubernetes inside Docker CE.  Run this script from this directory.

KUBE_CLUSTER="docker-for-desktop-cluster"
KUBE_USER="docker-for-desktop"

echo -n "Is your local Docker/Kubernetes environment running? (y/N)"
read confirm

if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    echo "...Creating Kubernetes namespaces"
    kubectl create -f namespaces/development.json
    kubectl create -f namespaces/test.json

    echo "...Creating Kubernetes contexts"
    kubectl config set-context auth-dev --namespace=auth-dev \
        --cluster=$KUBE_CLUSTER \
        --user=$KUBE_USER
    kubectl config set-context auth-test --namespace=auth-test \
        --cluster=$KUBE_CLUSTER \
        --user=$KUBE_USER
    
    echo "You may switch context using the command: $ kubectl config use-context {context_name}"
fi