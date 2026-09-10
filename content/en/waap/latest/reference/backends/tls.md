---
title: "TLS"
weight: 30
---

# TLS

### TLS Connection

Allows to enable TLS for the backend connection.

### Trusted CA Certificate

Select a trusted CA certificate for the connection. This will be used to verify the server
certificate of the backend.

### Skip Certificate Validation

Allows to disable validation of the backend server certificate. *This is not recommended for
production environments!*

### SNI Hostname

Defines the SNI hostname to use for the backend connection.

### Client Authentication

Allows to enable mutual authentication for the TLS connection to the backend by selecting a
[client certificate](../certificates/certificates-and-keys).

### Customize TLS Versions to use

Allows to define a specific set of TLS versions that are available for the backend connection. See
[TLS versions, ciphers and algorithms](../tls-settings).

### Customize supported Ciphers and Algorithms

The list of TLS ciphers and algorithms allowed for the backend connection. See
[TLS versions, ciphers and algorithms](../tls-settings).
