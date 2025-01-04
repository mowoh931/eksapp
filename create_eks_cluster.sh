#!/bin/bash

# Script to create an EKS cluster using eksctl

# Variables
CLUSTER_NAME="eksapp-cluster"
REGION="us-east-2"
NODEGROUP_NAME="standard-workers"
NODE_TYPE="t2.micro"
NODES=2
NODES_MIN=1
NODES_MAX=3

# Check if eksctl is installed
if ! command -v eksctl &> /dev/null
then
    echo "Error: eksctl is not installed. Please install eksctl and try again."
    exit 1
fi

# Create the EKS cluster
eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --nodegroup-name $NODEGROUP_NAME \
  --node-type $NODE_TYPE \
  --nodes $NODES \
  --nodes-min $NODES_MIN \
  --nodes-max $NODES_MAX \
  --managed

if [ $? -eq 0 ]; then
  echo "EKS cluster '$CLUSTER_NAME' created successfully."
else
  echo "Failed to create EKS cluster '$CLUSTER_NAME'."
  exit 1
fi
