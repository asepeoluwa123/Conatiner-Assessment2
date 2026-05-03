#!/bin/bash

set -e

echo "🚀 Starting MuchToDo with Docker Compose..."

docker-compose down
docker-compose up --build -d

echo "✅ Application is running!"
echo "👉 Backend: http://localhost:8080"
echo "👉 MongoDB: localhost:27017"