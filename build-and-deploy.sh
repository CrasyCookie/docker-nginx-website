#!/bin/sh

self="$(dirname "$(realpath "$0")")"
if [ -n "$1" ]; then
    name="$1"
else
    name="webserver"
fi

echo "Building..."
docker buildx build -t nginx-ssi-test "$self" && echo "Deploying..." || exit 1
docker run \
    --publish 80:80 \
    --mount type=bind,source="$self/website",target="/srv/www/website",readonly \
    --name "$name" \
    --detach nginx-ssi-test && echo "Done." || exit 2
