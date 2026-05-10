# Malware Document Scanner

![Build](https://github.com/stasolsh/melware-document-scanner/actions/workflows/custom-action.yml/badge.svg)
![Coverage](https://codecov.io/gh/stasolsh/melware-document-scanner/branch/master/graph/badge.svg)
![Java](https://img.shields.io/badge/Java-17-blue)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-6DB33F?logo=springboot)
![Maven](https://img.shields.io/badge/Maven-3.9+-blue)
![JUnit](https://img.shields.io/badge/JUnit-5-red?logo=junit5)
![License](https://img.shields.io/badge/license-MIT-green)

---

# Overview

Malware Document Scanner is a REST-based Spring Boot application designed to scan documents for suspicious or blacklisted IBAN numbers.

The application processes uploaded document URLs, extracts IBANs from supported file types, validates them against a blacklist stored in the database, and returns detailed scan results.

The system is extensible and built using a pluggable architecture for:
- document type processors
- security checks
- scan result aggregation

---

# Features

## Supported File Types
- PDF
- DOC (placeholder implementation)

## Security Checks
- IBAN blacklist validation
- Magic byte validation (planned / placeholder)

## Functionality
- REST API
- PDF parsing using Apache PDFBox
- Blacklisted IBAN detection
- Extensible check registration mechanism
- Modular document processors
- Exception handling
- CI/CD integration
- Code coverage reporting

---

# Architecture

## Main Flow

```text
Client Request
       │
       ▼
MalwareScannerController
       │
       ▼
MalwareScannerService
       │
       ▼
Registered Checks
       │
       ▼
Document Type Processor
       │
       ▼
IBAN Extraction & Validation
       │
       ▼
Scan Result Response
```

---

# Project Structure

```text
controller/
 └── MalwareScannerController

service/
 ├── MalwareScannerService
 ├── checks/
 │    ├── CheckIbanService
 │    └── CheckMagicByteService
 │
 └── filetype/
      ├── PdfDocumentTypeProcessor
      └── DocDocumentTypeProcessor

dao/
 └── BlacklistedIbanDao

model/
 ├── CheckEvent
 ├── CheckResultEvent
 └── FileType

utils/
 └── GetIbansFromPDF
```

---

# Tech Stack

- Java 17
- Spring Boot
- Spring MVC
- Spring Data JPA
- Maven
- H2 / SQL Database
- Apache PDFBox
- JUnit 5
- Mockito
- JaCoCo
- GitHub Actions

---

# REST API

## Scan Document

### Endpoint

```http
POST /api/v1/malwareScanner
```

Controller implementation: `MalwareScannerController` :contentReference[oaicite:0]{index=0}

---

## Request Example

```json
{
  "url": "file:///var/www/html/TestDataWithoutSuspicious.pdf",
  "fileType": "PDF"
}
```

Request model:
- `url` — file location
- `fileType` — document type (`PDF`, `DOC`) :contentReference[oaicite:1]{index=1}

---

## Example Response

```json
[
  {
    "state": "ok",
    "name": "IBAN_CHECK",
    "details": "There are not blacklisted IBAN's."
  },
  {
    "state": "ignored",
    "name": "MAGIC_BYTE_CHECK",
    "details": "Not Implemented Yet!"
  }
]
```

Result states:
- `ok`
- `suspicious`
- `error`
- `ignored`

Defined in `CheckResultEvent` :contentReference[oaicite:2]{index=2}

---

# Supported Checks

## IBAN Check

Implementation:
- `CheckIbanService`
- `PdfDocumentTypeProcessor`

The service:
1. Extracts IBANs from PDF
2. Compares them against blacklist entries
3. Returns scan result

Blacklist DAO:
`BlacklistedIbanDao` :contentReference[oaicite:3]{index=3}

PDF processor:
`PdfDocumentTypeProcessor` :contentReference[oaicite:4]{index=4}

IBAN extraction utility:
`GetIbansFromPDF` :contentReference[oaicite:5]{index=5}

---

## Magic Byte Check

Placeholder implementation for future malware detection.

Current implementation:
`CheckMagicByteService` :contentReference[oaicite:6]{index=6}

---

# Blacklisted IBANs

Example blacklist values stored in database:

```text
DE15300606010505780780
UPC82771401621500311
124343433444444444444
```

Entity:
`BlacklistedIban` :contentReference[oaicite:7]{index=7}

---

# Running the Application

## Build

```bash
mvn clean install
```

---

## Start Application

```bash
java -jar target/malware-document-scanner.jar
```

---

# Local URL

```text
http://localhost:9090
```

---

# Running Tests

Run all tests:

```bash
mvn clean test
```

Generate JaCoCo report:

```bash
mvn clean verify
```

Coverage report location:

```text
target/site/jacoco/index.html
```

---

# Design Highlights

## Strategy Pattern

Checks are dynamically registered by file type using:

```java
void register(FileType type, DocumentTypeProcessor documentType)
```

Implemented in:
- `CheckIbanService`
- `DocumentTypeProcessor`

:contentReference[oaicite:8]{index=8} :contentReference[oaicite:9]{index=9}

---

## Extensibility

New checks can be added by:
1. Implementing `Check`
2. Registering document processors
3. Adding processor implementation

New document types can be added by:
1. Implementing `DocumentTypeProcessor`
2. Registering supported `FileType`

---

# Author

Stanislav Olshanskyi