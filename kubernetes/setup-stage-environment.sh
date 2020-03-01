#!/usr/bin/env bash
# This script will create a Kubernetes stage environment when running 
# Kubernetes inside the lab.  Run this script from this directory.

KUBE_CLUSTER="tgw-lab-kubernetes"
KUBE_USER="kubernete-admin"

echo -n "Is your stage Kubernetes environment running? (y/N)"
read confirm

if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    echo "...Creating Kubernetes namespaces"
    kubectl create -f namespaces/test.json
    kubectl create -f namespaces/stage.json

    echo "...Creating Kubernetes contexts"
    kubectl config set-context lab-auth-test --namespace=auth-test \
        --cluster=$KUBE_CLUSTER \
        --user=$KUBE_USER
    kubectl config set-context lab-auth-stage --namespace=auth-stage \
        --cluster=$KUBE_CLUSTER \
        --user=$KUBE_USER
    
    echo "You may switch context using the command: $ kubectl config use-context {context_name}"
fi
