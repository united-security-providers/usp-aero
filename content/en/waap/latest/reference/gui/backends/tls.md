---
title: "TLS"
weight: 30
---

# TLS

### TLS Connection {#tlsEnabled}

Enables TLS for the connection to the backend. The other settings on this tab are only shown while
it is on.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate used to verify the backend's server certificate. Only shown while Skip
Certificate Validation is off.

- **Values:** one of the uploaded [CA certificates](../certificates/ca-certificates), or not defined
- **Default:** none
- **Required:** yes, when TLS Connection is on and Skip Certificate Validation is off

### Skip Certificate Validation {#skipCertificateValidation}

Disables the validation of the backend's server certificate. *This is not recommended for
production environments!*

- **Values:** `on` or `off`
- **Default:** `off`

### SNI Hostname {#sniHostname}

The SNI hostname sent in the TLS handshake with the backend.

- **Values:** [hostname](../../value-types#hostname)
- **Default:** none

### Client Authentication {#clientAuthenticationCertificateId}

The [client certificate](../certificates/certificates-and-keys) Aero WAAP presents to the backend
for mutual TLS authentication.

- **Values:** one of the uploaded certificates, or `-- disabled --`
- **Default:** none

### Customize TLS Versions to use {#customTlsVersionsEnabled}

Restricts the TLS versions available for the backend connection. See
[TLS versions, ciphers and algorithms](../../tls-settings).

- **Values:** `on` or `off`
- **Default:** `off`

## Customize supported Ciphers and Algorithms

The list of TLS ciphers and algorithms allowed for the backend connection. See
[TLS versions, ciphers and algorithms](../../tls-settings).

## Comments {#comments}

Free text about the backend's TLS settings. It is only shown in the configuration.

- **Values:** text
- **Default:** none
