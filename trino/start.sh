#!/bin/bash

echo "Starting cluster..."
docker-compose up -d

echo "Checking Trino status..."
until docker exec trino-coordinator curl -f http://localhost:8080/v1/info >/dev/null 2>&1; do
    echo "Waiting for Trino to start..."
    sleep 10
done

echo "Cluster is ready!"
echo "MinIO Web UI: http://localhost:9001 (minioadmin/minioadmin)" 
echo "Trino Web UI: http://localhost:8080"
echo ""

docker exec -it trino-coordinator trino

echo "Stopping cluster..."
docker compose down

echo "Clean volumes..."
docker volume rm -f \
  trino_minio_data \
  trino_trino_data \
  trino_trino_data_worker1 \
  trino_trino_data_worker2 \
  trino_trino_data_worker3 \
  trino_postgres_data \
  trino_trino_staging_worker1 \
  trino_trino_staging_worker2 \
  trino_trino_staging_worker3 \
  2>/dev/null || true
