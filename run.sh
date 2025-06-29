#!/bin/bash

# Build FerroOS image using the official project tag
echo "🔨 Building Docker image: ferroos/core"
docker build -t ferroos/core .

# Run the container with mounted frontend and roms, under a named session
echo "🚀 Running FerroOS container as 'FerroOS'"
docker run -it --rm \
  --name FerroOS \
  -v "$PWD/frontend":/opt/frontend \
  -v "$PWD/roms":/mnt/roms \
  ferroos/core
