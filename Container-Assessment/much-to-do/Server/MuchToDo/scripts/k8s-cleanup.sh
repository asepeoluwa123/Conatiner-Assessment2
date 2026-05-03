#!/bin/bash

set -e

echo "🧹 Cleaning up Kubernetes resources..."

kubectl delete -f k8s/ingress.yaml --ignore-not-found
kubectl delete -f k8s/backend-service.yaml --ignore-not-found
kubectl delete -f k8s/backend-deployment.yaml --ignore-not-found
kubectl delete -f k8s/backend-secret.yaml --ignore-not-found
kubectl delete -f k8s/backend-config.yaml --ignore-not-found

kubectl delete -f k8s/mongo-service.yaml --ignore-not-found
kubectl delete -f k8s/mongo-deployment.yaml --ignore-not-found
kubectl delete -f k8s/mongo-pvc.yaml --ignore-not-found
kubectl delete -f k8s/mongo-config.yaml --ignore-not-found
kubectl delete -f k8s/mongo-secret.yaml --ignore-not-found

echo "🧨 Optional: deleting namespace resources completed!"
echo "✅ Cleanup finished!"