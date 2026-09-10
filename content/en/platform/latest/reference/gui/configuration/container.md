---
title: "Container"
weight: 40
---

# Container

Configure the settings for the container registry to be used by this Aero system when pulling docker
images.

## Container Registry

### Hostname

The hostname (or IP address) of the container registry.

### Port

The listener port of the container registry.

### Switch "TLS"

Use this to enable TLS for the connection to the container registry.

### Switch "Disable Server Certificate Validation"

If enabled, the server certificate of the container registry will NOT be validated. Use this for
special cases when the registry may be using a self-signed or test certificate.

### Drop-Down "Trusted CA Certificate"

Unless server certificate validation has been disabled, a CA certificate must be selected here which
will be used to validate the container registry server certificate. Add CA certificates on the
[Certificates](certificates) screen.

### Username

The username to use to authenticate against the container registry.

### Password

The password to use to authenticate against the container registry.

### Image Namespace Prefix

The namespace prefix to use when pulling a particular docker image.
