xcopy /s /y .\docker-compose.yml ..\..\

set ORIGIN=%cd%
cd ../../
set ROOT=%cd%

docker compose -p malware-document-scanner -f docker-compose.yml stop malware-document-scanner

cd %ROOT%/malware-document-scanner
call mvn -T 1C clean install -DskipTests=true

cd %ROOT%/
docker compose -p malware-document-scanner -f docker-compose.yml up --build -d --no-deps malware-document-scanner

cd %ORIGIN%