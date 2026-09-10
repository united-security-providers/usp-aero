---
title: "TLS"
weight: 20
---

# TLS

The TLS tab lets you define TLS-related settings for the listener. Server certificates themselves
are managed on [Certificates & Keys](../certificates/certificates-and-keys) and selected per virtual
host; see [Virtual Hosts](../vhosts/virtual-hosts).

## Client Certificate Validation (mTLS)

### Trusted CA Certificate

The CA certificate used to validate client certificates presented during the TLS handshake.

### Optional validation

If enabled, a client certificate is validated when presented, but connections without one are still
accepted.

### Forward Client Certificate information with XFCC HTTP Header

If enabled, details of the validated client certificate are forwarded to the backend in the
`X-Forwarded-Client-Cert` HTTP header.

### SAN Match

Restricts which client certificates are accepted, by matching a Subject Alternative Name (of type
Email or Other Name) against a configured value, using an Exact, Prefix, Suffix or Regex matcher.
