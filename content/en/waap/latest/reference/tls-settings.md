---
title: "TLS versions, ciphers and algorithms"
weight: 60
---

# TLS versions, ciphers and algorithms

This shared block of settings appears wherever a screen offers "Customize TLS Versions to use" or
"Customize supported Ciphers and Algorithms" — for example on a [backend](backends/tls)'s TLS
tab.

### TLS Versions

Select which TLS versions (1.0, 1.1, 1.2, 1.3) are accepted. At least one version is required, and
the selected versions must be sequential without gaps.

### Cipher Suites for TLS 1.2 and older

The list of cipher suites allowed for TLS 1.2 and earlier connections.

### ECDH curves

The list of ECDH curves allowed for the TLS connection.

### Signature Algorithms

The list of signature algorithms allowed for the TLS connection.
