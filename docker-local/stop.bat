set ORIGIN=%cd%
cd ../../

docker compose -p melware-document-scanner -f docker-compose.yml down
cd %ORIGIN%