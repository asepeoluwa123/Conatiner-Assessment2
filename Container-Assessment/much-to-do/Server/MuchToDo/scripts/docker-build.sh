#!/bin/bash

set -e

echo "🚀 Building Docker image for MuchToDo backend..."

docker build -t muchtodo-backend:latest .

echo "✅ Docker image built successfully!"