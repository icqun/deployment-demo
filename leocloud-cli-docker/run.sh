#!/usr/bin/env bash
docker run \
  --rm \
  $(docker build -q $PWD/leocloud-cli-docker)
