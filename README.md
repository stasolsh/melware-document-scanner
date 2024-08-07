Rest-based solution for IBAN validity scanner
====

## Instructions:

Steps how to start current service:

1. run mvn -T 1C clean install
2. cd target
3. java -jar rest-based-solution.jar
4. use any REST client
# API endpoints

## POST

```
 http://localhost:9090/api/v1/malwareScanner
```

Payload example:

```
{
    "url":"file:///D:/Java%20Projects/task/Testdaten_Rechnungseinreichung.pdf",
    "fileType":"PDF"
}
```

Note: As blacklisted IBANs the application considers (list stored in DB):
```
DE15300606010505780780 
UPC82771401621500311 
124343433444444444444 
```