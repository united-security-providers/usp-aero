> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# TLS

The TLS tab lets you define TLS-related settings for the listener. Server certificates themselves
are managed on [Certificates & Keys](../certificates/certificates-and-keys) and selected per virtual
host; see [Virtual Hosts](../vhosts/virtual-hosts).

## TLS Versions

Select which TLS versions this listener accepts; see
[TLS versions, ciphers and algorithms](../../tls-settings).

## Client Certificate Validation (mTLS)

### Client Certificate Validation (mTLS) {#clientCertificateValidationEnabled}

Enables mutual TLS: the listener validates the client certificate presented during the TLS
handshake.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate used to validate client certificates presented during the TLS handshake.

- **Values:** one of the uploaded CA certificates (see
  [Certificates & Keys](../certificates/certificates-and-keys)), or not defined
- **Default:** none

### Optional validation {#optionalValidation}

If enabled, a client certificate is validated when presented, but connections without one are still
accepted.

- **Values:** `on` or `off`
- **Default:** `off`

### SAN Match {#sanMatches}

Restricts which client certificates are accepted, by matching a Subject Alternative Name (of type
Email or Other Name) against a configured value, using an Exact, Prefix, Suffix or Regex matcher.
Click the "+" icon to add a match.

### Type {#type}

The kind of Subject Alternative Name to match against.

- **Values:** `Email` or `Other Names`
- **Default:** `Email`
- **Required:** yes

### Matcher {#matcher}

How the Subject Alternative Name is compared against the configured value.

- **Values:** `Exact`, `Prefix`, `Suffix` or `Regex`
- **Default:** `Exact`
- **Required:** yes

### Value {#value}

The string value the Subject Alternative Name must match.

- **Values:** text of at most 1024 characters
- **Default:** none
- **Required:** yes

### OID {#oid}

The object identifier (OID) of the "Other Name" to match against.

- **Values:** text
- **Default:** none
- **Required:** yes, when Type is "Other Names"

### Forward Client Certificate information with XFCC HTTP Header {#forwardXfccHttpHeader}

If enabled, details of the validated client certificate are forwarded to the backend in the
`X-Forwarded-Client-Cert` HTTP header.

- **Values:** `on` or `off`
- **Default:** `off`

## Customize supported Ciphers and Algorithms

Overrides the default cipher suites, ECDH curves and signature algorithms for this listener; see
[TLS versions, ciphers and algorithms](../../tls-settings).
