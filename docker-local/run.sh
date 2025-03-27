#!/usr/bin/env bash

cp -r ./docker-compose.yml ../../

ORIGIN=$(pwd)
cd ../../
ROOT=$(pwd)

docker-compose -p melware-document-scanner -f docker-compose.yml stop melware-document-scanner

cd "$ROOT"/melware-document-scanner
mvn -T 1C clean install -DskipTests=true

cd "$ROOT"/
docker-compose -p melware-document-scanner -f docker-compose.yml up --build -d --no-deps melware-document-scanner

cd "$ORIGIN"