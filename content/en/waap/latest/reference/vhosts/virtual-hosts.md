---
title: "Virtual Hosts"
weight: 10
---

# Virtual Hosts

Here you can configure the virtual hosts. This screen shows the virtual servers which have been
configured for this WAAP instance. Each virtual host represents a single domain name. You may add
new hosts in order to represent additional sites.

## Tab "Settings"

### Name

The name is a label for the virtual host, just visible in the configuration.

### Listener

Select one of the configured [listeners](../listeners/listeners). The fields below show the IP and
HTTP settings of the selected listener.

### Hostnames

Allows to configure one or multiple hostnames for a virtual host. At least one hostname must be
configured. Click the "+" icon to add a hostname.

### Certificate

Select the server certificate to use for this virtual host, from the certificates managed on
[Certificates & Keys](../certificates/certificates-and-keys).

### Generate HTTP to HTTPS redirect

Enable this if all incoming requests to plain HTTP URLs should automatically be redirected to the
same URL, but on HTTPS.

### Strict Transport Security (HSTS)

Enables the HTTP `Strict-Transport-Security` response header, instructing browsers to only reach this
virtual host over HTTPS from then on.

## Routes

Allows to configure routes (URL locations) for this virtual host. Click the "+" icon to add a new
route. See [Routes](routes/routes).
