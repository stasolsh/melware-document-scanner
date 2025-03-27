xcopy /s /y .\docker-compose.yml ..\..\

set ORIGIN=%cd%
cd ../../
set ROOT=%cd%

docker compose -p melware-document-scanner -f docker-compose.yml stop melware-document-scanner

cd %ROOT%/melware-document-scanner
call mvn -T 1C clean install -DskipTests=true

cd %ROOT%/
docker compose -p melware-document-scanner -f docker-compose.yml up --build -d --no-deps melware-document-scanner

cd %ORIGIN%