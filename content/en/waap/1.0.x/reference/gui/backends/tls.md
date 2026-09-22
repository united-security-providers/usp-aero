---
title: "TLS"
weight: 30
---

# TLS

### TLS Connection {#tlsEnabled}

Allows to enable TLS for the backend connection.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

Select a trusted CA certificate for the connection. This will be used to verify the server
certificate of the backend.

- **Values:** one of the uploaded CA certificates (see
  [Certificates & Keys](../certificates/certificates-and-keys)), or not defined
- **Default:** none
- **Required:** yes, when TLS Connection is on and Skip Certificate Validation is off

### Skip Certificate Validation {#skipCertificateValidation}

Allows to disable validation of the backend server certificate. *This is not recommended for
production environments!*

- **Values:** `on` or `off`
- **Default:** `off`

### SNI Hostname {#sniHostname}

Defines the SNI hostname to use for the backend connection.

- **Values:** [hostname](../../value-types#hostname)
- **Default:** none

### Client Authentication {#clientAuthenticationCertificateId}

Allows to enable mutual authentication for the TLS connection to the backend by selecting a
[client certificate](../certificates/certificates-and-keys).

- **Values:** one of the uploaded certificates, or `-- disabled --`
- **Default:** none

### Customize TLS Versions to use {#customTlsVersionsEnabled}

Allows to define a specific set of TLS versions that are available for the backend connection. See
[TLS versions, ciphers and algorithms](../../tls-settings).

- **Values:** `on` or `off`
- **Default:** `off`

## Customize supported Ciphers and Algorithms

The list of TLS ciphers and algorithms allowed for the backend connection. See
[TLS versions, ciphers and algorithms](../../tls-settings).
