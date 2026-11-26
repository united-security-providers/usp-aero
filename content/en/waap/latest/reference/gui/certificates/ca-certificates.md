---
title: "CA Certificates"
weight: 20
---

# CA Certificates

The certificate chains of the Certificate Authorities this Aero WAAP trusts. They are used wherever a
certificate presented by someone else has to be validated. That is the certificate a
[backend](../backends/tls) presents, and the certificate a client presents to a
[listener](../listeners/tls).

Uploading or removing a CA certificate here does not change anything by itself. It only takes effect
where it is selected.

## List of CA certificates

The list shows the same columns as the [Certificates](certificates-and-keys#alias-column) tab,
without the Key column. The first column is called "Alias" here.

## Upload Certificate {#upload-certificate}

Adds a CA certificate to the list. Drag the file into the upload field or choose it manually.

- **Values:** a certificate file in PEM or DER format

### Alias (optional) {#alias}

A name for the certificate in the list. Without one, the list identifies the certificate by its
subject, which is harder to scan.

- **Values:** free text
- **Default:** none

## Download CA Certificate {#download-certificate}

Downloads a certificate from the list in the format you choose.

- **Values:** `PEM`, `DER`, `PKCS #7`
