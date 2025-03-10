#!/bin/sh

self="$(dirname "$(realpath "$0")")"

echo "Building..."
docker buildx build -t nginx-ssi-test "$self" && echo "Deploying..." || exit 1
docker run -d -p 80:80 --name nginx-webserver nginx-ssi-test && echo "Done." || exit 2
