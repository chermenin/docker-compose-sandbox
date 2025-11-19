#!/bin/bash

# Start Docker container
docker compose up -d

# Function to check if container is ready
wait_for_container() {
    local container_name=$1
    local max_attempts=30
    local attempt=1
    
    echo "Waiting for container $container_name to be ready..."
    
    while [ $attempt -le $max_attempts ]; do
        if docker ps --filter "name=$container_name" --format "{{.Status}}" | grep -q "Up"; then
            echo "Container $container_name is running!"
            return 0
        fi
        echo "Attempt $attempt/$max_attempts - container not ready yet..."
        sleep 2
        ((attempt++))
    done
    
    echo "Error: Container $container_name failed to start within timeout"
    return 1
}

# Wait for container
wait_for_container "kafka"

# Start interactive bash session
echo "Starting bash session..."
docker exec -it kafka bash

# Down Docker container
docker compose down
