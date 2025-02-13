# eksapp

* This is a sample application that demonstrates how to deploy a simple web application to an Amazon EKS cluster.

# Prerequisites:

1. An AWS account
2. An EKS cluster
3. kubectl
4. eksctl
5. Docker
6. Maven
7. Java 11+
8. Git
9. An IDE (optional)
10. An AWS CLI profile
11. An IAM role with the necessary permissions
12. A Docker Hub account (optional)

# Steps to deploy the application to an EKS cluster:

```shell script 
mvn clean package
docker build -t eksapp .
docker tag eksapp:latest <your-dockerhub-username>/eksapp:latest
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin
docker push <your-dockerhub-username>/eksapp:latest
eksctl create cluster \
  --name "${CLUSTER_NAME}" \
  --region "${REGION}" \
  --nodegroup-name "${NODE_GROUP_NAME}" \
  --node-type "${NODE_TYPE}" \
  --nodes "${DESIRED_NODES}" \
  --nodes-min "${MIN_NODES}" \
  --nodes-max "${MAX_NODES}" \
  --managed
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get nodes
kubectl get pods
kubectl get svc
eksctl delete cluster --name eksapp-cluster
```
