xcopy /s /y .\docker-compose.yml ..\..\

set ORIGIN=%cd%
cd ../../
set ROOT=%cd%

docker compose -p rest-based -f docker-compose.yml stop rest-based-solution

cd %ROOT%/rest-based-solution
call mvn -T 1C clean install -DskipTests=true

cd %ROOT%/
docker compose -p rest-based -f docker-compose.yml up --build -d --no-deps rest-based-solution

cd %ORIGIN%