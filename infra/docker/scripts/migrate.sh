#!/bin/bash
set -e

echo "Running database migrations for Tailor Swif..."

docker compose exec api mix ecto.migrate

echo "Migrations complete."