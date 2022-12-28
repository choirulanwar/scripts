#!/bin/sh

#Update
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y

#Git
sudo apt-get install git -y

#Docker
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update -y
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
su - ${USER}
sudo apt-get install docker-compose-plugin

#Pull docker image
docker pull mongo &&
  docker pull nginx:alpine &&
  docker pull traefik:latest &&
  docker pull redis:alpine &&
  docker pull golang:alpine &&
  docker pull node:alpine &&
  docker pull consul:latest &&
  docker pull vault:latest &&
  docker pull rabbitmq:management-alpine &&
  docker pull storytel/dnsmasq:latest

#Kubernetes
sudo apt-get update -y && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
