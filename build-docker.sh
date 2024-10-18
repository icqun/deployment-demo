#!/usr/bin/env bash

set -e

mvn clean package
cp src/main/docker/Dockerfile target
docker build --tag ghcr.io/icqun/deployment-demo:latest ./target
docker login ghcr.io
docker push ghcr.io/icqun/deployment-demo:latest
