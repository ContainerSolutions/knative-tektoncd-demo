#!/bin/bash

set -e

echo
echo "=== Deleting the VM ==="
echo
multipass delete microk8s-knative

echo
echo "=== Permanently deleting all deleted VMs ==="
echo
multipass purge 

echo
echo "=== Remove kubeconfig ==="
echo
#brew cask remove multipass

echo
echo "=== Removing the kubeconfig ==="
echo
rm kubeconfig