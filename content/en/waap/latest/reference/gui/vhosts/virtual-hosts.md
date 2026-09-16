---
title: "Virtual Hosts"
weight: 10
aliases:
  - /waap/latest/reference/vhosts/virtual-hosts/
---

# Virtual Hosts

Here you can configure the virtual hosts. This screen shows the virtual servers which have been
configured for this WAAP instance. Each virtual host represents a single domain name. You may add
new hosts in order to represent additional sites.

## Virtual Hosts list

The table lists the configured virtual hosts.

### Name {#name-column}

The virtual host's name.

### Hostnames {#hostnames-column}

The hostnames the virtual host answers to.

### IPv4 Address {#ipv4}

The IPv4 address of the virtual host's listener.

### IPv6 Address {#ipv6}

The IPv6 address of the virtual host's listener.

### HTTP Port {#httpPort}

The HTTP port of the virtual host's listener.

### HTTPS Port {#httpsPort}

The HTTPS port of the virtual host's listener.

### Add Virtual Host {#new-vhost}

Creates a new virtual host and opens its Settings tab.

- **Values:** button

### Edit / Details {#edit-vhost}

Opens the virtual host for editing (or viewing, in read-only mode).

- **Values:** button

### Delete {#delete-vhost}

Deletes the virtual host, after confirmation.

- **Values:** button

## Tab "Settings"

### Name {#name}

The name is a label for the virtual host, just visible in the configuration.

- **Values:** free text. Use only letters, digits, hyphens, dots (`.`) and spaces; must start and
  end with a letter or digit, at most 253 characters.
- **Required:** yes

### Listener {#listenerId}

Select one of the configured [listeners](../listeners/listeners). The fields below show the IP and
HTTP settings of the selected listener.

- **Values:** one of the configured listeners
- **Required:** yes

### Hostnames {#hostnames}

Allows to configure one or multiple hostnames for a virtual host. At least one hostname must be
configured, up to 16. Click the "+" icon to add a hostname.

- **Values:** a [hostname](../../value-types#hostname), optionally prefixed with `*.` for a wildcard
  label; must not be an IP address
- **Default:** none
- **Required:** yes

### Certificate {#certificateOrProviderId}

Select the server certificate to use for this virtual host, from the certificates managed on
[Certificates & Keys](../certificates/certificates-and-keys).

- **Values:** one of the configured certificates or ACME providers
- **Required:** yes

### Generate HTTP to HTTPS redirect {#generateHttpToHttpsRedirect}

Enable this if all incoming requests to plain HTTP URLs should automatically be redirected to the
same URL, but on HTTPS.

- **Values:** `on` or `off`
- **Default:** `on`

## Strict Transport Security (HSTS) {#hstsEnabled}

Enables the HTTP `Strict-Transport-Security` response header, instructing browsers to only reach this
virtual host over HTTPS from then on. Turning it off also clears the settings below.

- **Values:** `on` or `off`
- **Default:** `off`

### Max Age {#maxAge}

How long, in seconds, the browser should remember that this site is only to be accessed using
HTTPS.

- **Values:** a number of seconds, from `0` to `15768000`
- **Default:** `15768000`
- **Required:** yes

### Include Subdomains {#includeSubDomains}

Whether the HSTS rule also applies to all of the site's subdomains.

- **Values:** `on` or `off`
- **Default:** `on`

### Preload {#preload}

Whether the site should be included in browser HSTS preload lists.

- **Values:** `on` or `off`
- **Default:** `off`

## Routes

Allows to configure routes (URL locations) for this virtual host. Click the "+" icon to add a new
route. See [Routes](routes/routes).
