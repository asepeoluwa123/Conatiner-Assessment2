#!/bin/bash

set -e

echo "🚀 Loading Docker image into Kind cluster..."

kind load docker-image muchtodo-backend:latest --name muchtodo

echo "📦 Applying Kubernetes manifests..."

kubectl apply -f Kubernetes/mongodb/mongo-secret.yaml
kubectl apply -f Kubernetes/mongodb/mongo-config.yaml
kubectl apply -f Kubernetes/mongodb/mongo-pvc.yaml
kubectl apply -f Kubernetes/mongodb/mongo-deplyoment.yaml
kubectl apply -f Kubernetes/mongodb/mongo-service.yaml

kubectl apply -f Kubernetes/mongodb/backend/backend-config.yaml
kubectl apply -f Kubernetes/mongodb/backend/backend-secret.yaml
kubectl apply -f Kubernetes/mongodb/backend/backend-deployment.yaml
kubectl apply -f Kubernetes/mongodb/backend/backend-service.yaml

kubectl apply -f Kubernetes/ingress.yaml

echo "⏳ Waiting for pods to be ready..."
kubectl get pods -w
