#!/bin/bash

# Do not run if removal already in progress.
pgrep "docker rm" && exit 0

# Remove Dead and Exited containers.
docker rm $(docker ps -a | grep "Dead\|Exited" | awk '{print $1}'); true

# It will fail to remove images currently in use.
docker rmi $(docker images -qf dangling=true); true

# Clean up unused docker volumes
docker volume ls -qf dangling=true | xargs --no-run-if-empty docker volume rm
