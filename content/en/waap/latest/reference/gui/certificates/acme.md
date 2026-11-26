---
title: "ACME providers"
weight: 30
---

# ACME providers

This tab lists the configured ACME providers. A virtual host can use a provider instead of an
uploaded certificate. Its certificate is then issued and renewed automatically.

## List of ACME providers

### Name {#name-column}

The provider's name.

### CA URL {#caUrl-column}

The provider's [Certificate Authority URL](#certificateAuthorityUrl).

### Email {#email-column}

The provider's [Email address](#emailAddress).

### EAB {#eab-column}

Whether [External Account Binding](#eabKeyId) credentials are set.

### Key Type {#keyType-column}

The provider's [Key Type](#keyType).

### Actions {#actions}

Open a provider ("Edit" or, in read-only mode, "Details"), or delete it.

### Create ACME Provider {#create-provider}

The "+" icon opens the dialog to add a provider.

## Create ACME Provider

### Name {#name}

A name for the ACME provider. This is the name that is shown wherever the provider can be selected
in other configuration screens.

- **Values:** free text
- **Default:** none
- **Required:** yes

### Certificate Authority URL {#certificateAuthorityUrl}

The URL of the provider's ACME directory endpoint.

- **Values:** an `http://` or `https://` URL
- **Default:** none
- **Required:** yes

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate used to validate the ACME server's own certificate. The list offers the
certificates added under [CA Certificates](ca-certificates).

- **Values:** one of the configured CA certificates
- **Default:** none

### Skip Certificate Validation {#skipCertificateValidation}

Accepts the ACME server's certificate without validating it. This removes the protection TLS gives
against a forged endpoint, so use it only against a test server.

- **Values:** `on` or `off`
- **Default:** `off`

### Email address {#emailAddress}

The address the provider sends notices to, such as warnings about a renewal that is not working. Use
an address that is monitored. An expired certificate usually announces itself here first.

- **Values:** an e-mail address
- **Default:** none
- **Required:** yes

### Key Type {#keyType}

The key type requested for the issued certificate.

- **Values:** `ECDSA P-256`, `ECDSA P-384`, `RSA 2048` or `RSA 4096`
- **Default:** `ECDSA P-256`

## External Account Binding (EAB)

Your ACME provider may require specific credentials to request certificates. Providers that issue
certificates to known customers rather than to anyone typically do. Leave both fields empty when the
provider does not use external account binding.

### Key ID {#eabKeyId}

The account identifier issued by the provider.

- **Values:** free text
- **Default:** none

### HMAC Key {#eabHmacKey}

The key used to authenticate this client against the ACME server.

- **Values:** free text
- **Default:** none
