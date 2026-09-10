---
title: "ACME providers"
weight: 30
---

# ACME providers

Here one or multiple ACME providers can be configured. Each configured provider can then be used /
referenced in the setup of a virtual host. Click the "+" icon to add a new ACME provider to the
list.

## Create ACME Provider

### Name

This mandatory field represents a name / label for the ACME provider. This is the name that will be
displayed in other configuration screens.

### Certificate Authority URL

Must be configured with the URL of the ACME CA endpoint of the provider.

### Trusted CA Certificate

Optional. Allows to select one of the configured (uploaded) CA certificates which will be used to
validate the ACME certificates.

### Switch "Skip Certificate Validation"

If enabled, the ACME certificate will not be validated (if it was created by a trusted certificate
authority etc.).

### Email address

The email address of your organization where the ACME provider will send warnings etc. if there are
issues with the ACME certificate process.

### Key Type

The desired key type for the ACME-provided certificate.

### External Account Binding (EAB)

Your ACME provider may require specific credentials to request certificates. These credentials must
be configured in these two fields:

- **Key ID** - Provider account identifier.
- **HMAC key** - Used to authenticate the client against the ACME server.
