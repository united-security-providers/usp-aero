---
title: "Container"
weight: 40
---

# Container

The container registry this Aero system pulls its container images from.

## Container Registry

### Hostname {#hostname}

The hostname (or IP address) of the container registry.

- **Values:** [hostname](../../value-types#hostname)
- **Required:** yes

### Port {#port}

The listener port of the container registry.

- **Values:** [port](../../value-types#port)
- **Default:** `443`

### TLS {#tlsEnabled}

Enables TLS for the connection to the container registry. The two settings below are only shown
while it is on.

- **Values:** `on` or `off`
- **Default:** `off`

### Disable Server Certificate validation {#disableServerCertificateValidation}

If enabled, the server certificate of the container registry is not validated. Use this only when
the registry uses a self-signed or test certificate.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate used to validate the container registry's server certificate. Only shown while
server certificate validation is on. Add CA certificates on the [Certificates](certificates) screen.

- **Values:** one of the CA certificates uploaded on the [Certificates](certificates) screen

### Username {#username}

The username to use to authenticate against the container registry.

- **Values:** free text, at most 255 characters

### Password {#password}

The password to use to authenticate against the container registry. Not shown in read-only mode.

- **Values:** free text, at most 255 characters

### Image Namespace prefix {#imageNamespacePrefix}

The namespace prefix to use when pulling a particular docker image.
Typically only required when using your own mirror registry.

- **Values:** free text, at most 255 characters
