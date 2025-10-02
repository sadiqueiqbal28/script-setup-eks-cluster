#!/bin/bash

read -p "What would you like to name your cluster: " cluster_name
read -p "Number of Nodes: " nodes
read -p "Enter Minimum Node: " min_node
read -p "Enter Maximum Node: " max_node
read -p "Enter AWS region: " aws_region
read -p "Node Type: " node_type

# Update Respositories
sudo apt-get update && sudo apt-get upgrade -y

# Setup AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
rm -rf awscliv2.zip
sudo ./aws/install
rm -rf aws

# Setup kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Setup eksctl
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

# Launch cluster
eksctl create cluster --name ${cluster_name} --region ${aws_region} --nodes ${nodes} --node-type ${node_type} --nodes-min ${min_node} --nodes-max ${max_node}