#!/bin/zsh
set -ex

# clean-up
kind delete cluster --name reg-util

# create cluster
kind create cluster --config=../manifest/kind/cluster-config.yaml

# install ingress
kapp deploy -a ingress-nginx -n kube-system \
          --wait-timeout 5m -y \
          -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml



# install reposilite
kapp deploy -a reposilite -n kube-system \
          --wait-timeout 5m -y \
          -f ../manifest/reposilite/reposilite.yaml
