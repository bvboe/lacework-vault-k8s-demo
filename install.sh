#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: install.sh <Lacework AccessToken>"
    exit 1
fi

kind create cluster --image kindest/node:v1.19.11@sha256:07db187ae84b4b7de440a73886f008cf903fcf5764ba8106a9fd5243d6f32729

helm repo add hashicorp https://helm.releases.hashicorp.com

helm install vault --wait --set='server.dev.enabled=true' hashicorp/vault
sleep 10

kubectl cp init-vault-in-container.sh vault-0:/home/vault/init-vault-in-container.sh

kubectl exec vault-0 -- /bin/sh -c /home/vault/init-vault-in-container.sh

kubectl exec vault-0 -- vault kv put secret/lacework accesstoken=$1 serverurl=https://api.lacework.net
sleep 10

kubectl apply -f lacework-vault-k8s.yaml
