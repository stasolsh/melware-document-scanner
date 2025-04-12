set ORIGIN=%cd%
cd ../../

docker compose -p malware-document-scanner -f docker-compose.yml down
cd %ORIGIN%