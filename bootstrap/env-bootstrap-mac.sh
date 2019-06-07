#!/bin/bash
#A bootstrap script for Mac to deploy a microk8s vm with Istio enabled.

set -e

# echo
# echo "=== Installing Homebrew ==="
# echo
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# echo
# echo "=== Installing Multipass ==="
# echo
# brew search multipass
# brew cask install multipass

echo
echo "=== Creating a microk8s vm with istio enabled ==="
echo
multipass launch --name microk8s-knative --mem 8G --disk 40G --cpus 2
multipass exec microk8s-knative -- sudo snap install microk8s --classic
multipass exec microk8s-knative -- sudo iptables -P FORWARD ACCEPT
#Waiting for microk8s to start up all necessary processes. I observed that some times it fails to enable istio if enabled immediately.
sleep 60
multipass exec microk8s-knative -- sudo microk8s.enable istio

echo
echo "=== Fetching the kubeconfig for remote access ==="
echo
multipass exec microk8s-knative -- /snap/bin/microk8s.config > kubeconfig


echo
echo "=== Installing Knative ==="
echo
kubectl --kubeconfig=kubeconfig apply --selector knative.dev/crd-install=true \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/serving.yaml \
   --filename https://github.com/knative/build/releases/download/v0.6.0/build.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.6.0/release.yaml \
   --filename https://github.com/knative/eventing-sources/releases/download/v0.6.0/eventing-sources.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/monitoring.yaml \
   --filename https://raw.githubusercontent.com/knative/serving/v0.6.0/third_party/config/build/clusterrole.yaml

sleep 60

kubectl --kubeconfig=kubeconfig apply --filename https://github.com/knative/serving/releases/download/v0.6.0/serving.yaml --selector networking.knative.dev/certificate-provider!=cert-manager \
   --filename https://github.com/knative/build/releases/download/v0.6.0/build.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.6.0/release.yaml \
   --filename https://github.com/knative/eventing-sources/releases/download/v0.6.0/eventing-sources.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/monitoring.yaml \
   --filename https://raw.githubusercontent.com/knative/serving/v0.6.0/third_party/config/build/clusterrole.yaml