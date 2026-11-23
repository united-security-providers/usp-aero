---
title: "Container"
weight: 40
---

# Container

Configure the settings for the container registry to be used by this Aero system when pulling docker
images.

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

Use this to enable TLS for the connection to the container registry.

- **Values:** `on` or `off`
- **Default:** `off`

### Disable Server Certificate validation {#disableServerCertificateValidation}

If enabled, the server certificate of the container registry will NOT be validated. Use this for
special cases when the registry may be using a self-signed or test certificate.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

Unless server certificate validation has been disabled, a CA certificate must be selected here which
will be used to validate the container registry server certificate. Add CA certificates on the
[Certificates](certificates) screen.

- **Values:** one of the CA certificates uploaded on the [Certificates](certificates) screen

### Username {#username}

The username to use to authenticate against the container registry.

- **Values:** free text, at most 255 characters
- **Required:** no

### Password {#password}

The password to use to authenticate against the container registry.

- **Values:** free text, at most 255 characters
- **Required:** no

### Image Namespace prefix {#imageNamespacePrefix}

The namespace prefix to use when pulling a particular docker image.
Typically only required when using your own mirror registry.

- **Values:** free text, at most 255 characters
- **Required:** no
