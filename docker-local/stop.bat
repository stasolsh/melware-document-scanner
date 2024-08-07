set ORIGIN=%cd%
cd ../../

docker compose -p rest-based -f docker-compose.yml down
cd %ORIGIN%