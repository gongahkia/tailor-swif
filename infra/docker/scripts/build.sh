#!/bin/bash
set -e

echo "Building all Docker images for Tailor Swif..."

docker build -t tailor-swif-web:latest ../web -f ../docker/web/Dockerfile
docker build -t tailor-swif-api:latest ../api -f ../docker/api/Dockerfile

if [ -f ../docker/db/Dockerfile ]; then
  docker build -t tailor-swif-db:latest ../docker/db
fi

if [ -f ../docker/redis/Dockerfile ]; then
  docker build -t tailor-swif-redis:latest ../docker/redis
fi

echo "Build complete."