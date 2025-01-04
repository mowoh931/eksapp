#!/bin/bash

# Set variables for cluster name, region, and node group details.  Make these configurable.
CLUSTER_NAME="eksapp-cluster"
REGION="us-east-2"  # Replace with your desired region
NODE_GROUP_NAME="standard-workers"
NODE_TYPE="t2.micro" # Replace with your desired instance type
MIN_NODES=1
MAX_NODES=3
DESIRED_NODES=2


# Authenticate to your AWS account (ensure your AWS credentials are configured).  Consider using a role instead of access keys for enhanced security.


# Create the EKS cluster.
eksctl create cluster \
  --name "${CLUSTER_NAME}" \
  --region "${REGION}" \
  --nodegroup-name "${NODE_GROUP_NAME}" \
  --node-type "${NODE_TYPE}" \
  --nodes "${DESIRED_NODES}" \
  --nodes-min "${MIN_NODES}" \
  --nodes-max "${MAX_NODES}" \
  --managed


# Verify cluster creation (optional)
eksctl get cluster \
 --name "${CLUSTER_NAME}" \
 --region "${REGION}"
