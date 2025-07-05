#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}

if [ "$ENVIRONMENT" = "prod" ]; then
  COMPOSE_FILE="docker-compose.prod.yml"
else
  COMPOSE_FILE="docker-compose.yml"
fi

echo "Deploying Tailor Swif stack using $COMPOSE_FILE..."

docker compose -f $COMPOSE_FILE up -d --build

echo "Deployment complete."