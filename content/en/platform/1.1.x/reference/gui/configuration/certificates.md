---
title: "Certificates"
weight: 50
---

# Certificates {#certificates-overview}

## Tab "Management Access"

Configure the server certificate of the administration UI.

### Active Certificate {#activeCertificateId}

Select a server certificate from the list of certificates added in the "Available Certificates"
section below.

- **Values:** one of the certificates listed under [Available Certificates](#certificates) below

### Automatic Certificate renewal (ACME) {#acmeEnabled}

Use this option to instead have the server certificate be generated and renewed automatically using
the ACME protocol. The fields below appear once this is turned on.

- **Values:** `on` or `off`
- **Default:** `off`

### Additional SANs {#subjectAltNames}

The additional SANs the certificate should hold.

- **Values:** free text
- **Required:** no

### Certificate Authority URL {#certificateAuthorityUrl}

The ACME server to request the certificate from.

- **Values:** a URL (`http://` or `https://`)
- **Required:** yes

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate used to validate the ACME server's own certificate. Add CA certificates on the
[Tab "CA Certificates"](#tab-ca-certificates) below.

- **Values:** one of the CA certificates uploaded under [Tab "CA Certificates"](#tab-ca-certificates)

### Skip Certificate Validation {#skipCertificateValidation}

Skips validation of the ACME server's certificate. This is turned on automatically whenever no
[Trusted CA Certificate](#trustedCaCertificateId) is selected.

- **Values:** `on` or `off`
- **Default:** `off`

### Contact Email Address {#contactEmailAddress}

The email address the ACME server uses to contact you about the certificate (e.g. renewal or
revocation notices).

- **Values:** an email address
- **Required:** yes

### Key Type {#keyType}

The key algorithm and size to generate the certificate with.

- **Values:** one of the key types supported by this system
- **Required:** yes

### External Account Binding (EAB)

The following two fields are only needed when the ACME server requires an external account to be
linked to the request (External Account Binding, EAB):

### Key ID {#eabKeyId}

The ID provided by the ACME CA.

- **Values:** free text
- **Required:** no

### HMAC Key {#eabHmacKey}

The matching token for the ID provided by the ACME CA.

- **Values:** free text
- **Required:** no

### Available Certificates {#certificates}

Click the "+" icon to either upload a certificate or create a self-signed one. Click the "trashcan"
icon in order to delete a certificate.

Uploading a certificate asks for the following:

### Alias {#alias}

A freely defined text label for the certificate, shown wherever it can be selected. This also applies
to the alias of an uploaded CA certificate (see [Tab "CA Certificates"](#tab-ca-certificates) below).

- **Values:** free text
- **Required:** no

### Password {#password}

The password protecting the uploaded PKCS#12 certificate file, if any.

- **Values:** free text
- **Required:** no

## Tab "CA Certificates"

Click the "+" icon to upload CA certificates of trusted certificate authorities. These certificates
can then be selected in various other configuration screens.

When uploading a CA certificate, an "Alias" may be defined (see [Alias (optional)](#alias) above).
This alias will be shown as a label in other configuration screens.
