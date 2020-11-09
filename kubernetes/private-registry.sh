#!/usr/bin/env bash
# This script creates a Docker registry secret for the default service account in
# a specified namespace.

REGISTRY_URL=https://index.docker.io/v1/
USERNAME=tgwconsulting
EMAIL=sean@tgwconsulting.co

echo -n "Enter namespace to add secret: "
read K8S_NAMESPACE
echo -n "Enter registry password: "
read -s PASSWORD

echo ""
echo "...Adding registry credentials as secret to Kubernetes"

kubectl create secret docker-registry regcred --docker-server=$REGISTRY_URL \
    --docker-username=$USERNAME --docker-password=$PASSWORD \
    --docker-email=$EMAIL --namespace=$K8S_NAMESPACE


echo ""
echo "...Adding registry credentials secret to service account"

kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "regcred"}]}' --namespace=$K8S_NAMESPACE