#!/usr/bin/env bash

ORIGIN=$(pwd)
cd ../../

docker-compose -p rest-based -f docker-compose.yml down
cd "$ORIGIN"