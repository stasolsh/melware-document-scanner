# Rest-based solution for IBAN validity scanner
![Build](https://github.com/stasolsh/melware-document-scanner/actions/workflows/custom-action.yml/badge.svg)
![Coverage](https://codecov.io/gh/stasolsh/melware-document-scanner/branch/master/graph/badge.svg)
![Java](https://img.shields.io/badge/Java-17-blue)
![Maven](https://img.shields.io/badge/Maven-3.9+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

====

## Instructions:

Steps how to start current service:

1. run mvn -T 1C clean install
2. cd target
3. java -jar malware-document-scanner.jar
4. use any REST client
# API endpoints

## POST

```
 http://localhost:9090/api/v1/malwareScanner
```

Payload example:

```
{
    "url":"file:///var/www/html/TestDataWithoutSuspicious.pdf",
    "fileType":"PDF"
}
```

Note: As blacklisted IBANs the application considers (list stored in DB):
```
DE15300606010505780780 
UPC82771401621500311 
124343433444444444444 
```