#!/usr/bin/env bash

ORIGIN=$(pwd)
cd ../../

docker-compose -p malware-document-scanner -f docker-compose.yml down
cd "$ORIGIN"