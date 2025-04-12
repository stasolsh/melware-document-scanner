#!/usr/bin/env bash

cp -r ./docker-compose.yml ../../

ORIGIN=$(pwd)
cd ../../
ROOT=$(pwd)

docker-compose -p malware-document-scanner -f docker-compose.yml stop malware-document-scanner

cd "$ROOT"/malware-document-scanner
mvn -T 1C clean install -DskipTests=true

cd "$ROOT"/
docker-compose -p malware-document-scanner -f docker-compose.yml up --build -d --no-deps malware-document-scanner

cd "$ORIGIN"