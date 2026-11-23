> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# ACME providers

Here one or multiple ACME providers can be configured. Each configured provider can then be used /
referenced in the setup of a virtual host, which lets that virtual host's certificate be issued and
renewed automatically instead of being uploaded by hand. Click the "+" icon to add a new ACME
provider to the list.

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
an address that is monitored - an expired certificate usually announces itself here first.

- **Values:** an e-mail address
- **Default:** none
- **Required:** yes

### Key Type {#keyType}

The key type requested for the issued certificate.

- **Values:** one of the key types offered by the system
- **Default:** none
- **Required:** yes

## External Account Binding (EAB)

Your ACME provider may require specific credentials to request certificates. Providers that issue
certificates to known customers rather than to anyone typically do. Leave both fields empty when the
provider does not use external account binding.

### Key ID {#eabKeyId}

The account identifier issued by the provider.

- **Values:** free text
- **Default:** none

### HMAC key {#eabHmacKey}

The key used to authenticate this client against the ACME server.

- **Values:** free text
- **Default:** none
