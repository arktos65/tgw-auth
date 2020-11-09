#!/usr/bin/env bash
# Use this script to start the proxy if you want to use Kompose to deploy the application
# to your Docker Kubernetes cluster.
#
# Start the proxy, then run $ kompose up

kubectl proxy --port=8080
