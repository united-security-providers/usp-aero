---
title: "Certificates & Keys"
weight: 10
---

# Certificates & Keys

Allows to configure the certificates and CA chains required for virtual hosts or to protect TLS
connections.

## Tab "Certificates"

The "Certificates" tab lists the certificates and keys configured on the appliance. Click the "+"
icon for one of three actions: Upload Key/Certificate, Create Self-signed Certificate, or Create Key
/ CSR. Click a row to view or rename an entry. CA certificates are managed separately; see
[CA Certificates](ca-certificates).

### Name {#alias-column}

The certificate or key's name.

- **Values:** text

### Subject {#subject}

The certificate's subject.

- **Values:** text

### Issuer {#issuer}

The certificate's issuer.

- **Values:** text

### Expires {#expires}

The date the certificate expires.

- **Values:** date and time

### Key {#key}

The key type, shown only on this tab.

- **Values:** text

### Fingerprint (SHA-1) {#fingerprint}

The certificate's SHA-1 fingerprint.

- **Values:** text

### Actions {#actions}

View an entry's details, download it, or delete it. Deleting is not available while the entry is in
use.

## Upload Key/Certificate

Drag and drop the certificate and/or key file (PKCS#12, PEM/DER format) into the predefined field or
choose the file manually. The certificate must set the following keyUsage flags: "Digital Signature",
"Non Repudiation" and "Key Encipherment".

### Name {#name}

A label for the uploaded certificate or key, used to reference it in other configuration screens.

- **Values:** text
- **Required:** yes

### Password {#password}

The passphrase protecting the uploaded PKCS#12 file, if any.

- **Values:** text
- **Default:** none

## Create Self-signed Certificate

### Name {#alias}

A label for the certificate, used to reference it in other configuration screens.

- **Values:** text of at most 80 characters
- **Required:** yes

### Key Type {#keyTypeAndSignature}

The key type and signature algorithm for the generated certificate.

- **Values:** `ECDSA P-256`, `ECDSA P-384`, `RSA 2048 / SHA 256`, `RSA 3072 / SHA 256`,
  `RSA 3072 / SHA 384`, `RSA 4096 / SHA 256`, `RSA 4096 / SHA 384` or `RSA 4096 / SHA 512`
- **Default:** the first entry offered by the appliance
- **Required:** yes

### Validity {#validityDays}

How many days the generated certificate is valid for.

- **Values:** a whole number of days, 1 or more
- **Default:** none
- **Required:** yes

The certificate's [subject](#certificate-subject) is configured as described below.

## Certificate subject

Used by "Create Self-signed Certificate" and "Create Key / CSR".

### Common Name (CN) {#commonName}

- **Values:** text of at most 64 characters
- **Default:** none
- **Required:** yes

### Country (C) {#country}

- **Values:** text
- **Default:** none

### State or Province (ST) {#stateOrProvince}

- **Values:** text
- **Default:** none

### Locality (L) {#locality}

- **Values:** text
- **Default:** none

### Organization (O) {#organization}

- **Values:** text
- **Default:** none

### Organizational Unit (OU) {#organizationalUnit}

- **Values:** text
- **Default:** none

### Email address {#emailAddress}

- **Values:** a valid email address
- **Default:** none

### Alternative domain names {#alternativeDomainNames}

- **Values:** text, multiple names separated by spaces
- **Default:** none

## Create Key / CSR

Creates a new private key, or a Certificate Signing Request for an existing one, for download.

### Name {#name-csr}

A label for the key, used to reference it in other configuration screens.

- **Values:** text of at most 80 characters
- **Required:** yes

### Private Key {#privateKeyId}

The existing private key to create a Certificate Signing Request for, or a newly generated one.

- **Values:** one of the existing keys, or `-- Create New Key --`
- **Default:** `-- Create New Key --`

### Key type {#keyTypeAndSignature-csr}

The key type and signature algorithm for a newly generated key. Not shown when an existing private
key is selected above.

- **Values:** `ECDSA P-256`, `ECDSA P-384`, `RSA 2048 / SHA 256`, `RSA 3072 / SHA 256`,
  `RSA 3072 / SHA 384`, `RSA 4096 / SHA 256`, `RSA 4096 / SHA 384` or `RSA 4096 / SHA 512`
- **Default:** the first entry offered by the appliance
- **Required:** yes, unless an existing private key is selected above

When creating a new key, its [subject](#certificate-subject) is configured as described above.

## Rename

Opened from a row's details.

### Name {#name-rename}

A label for the certificate or key, used to reference it in other configuration screens.

- **Values:** text of at most 80 characters
- **Required:** yes
