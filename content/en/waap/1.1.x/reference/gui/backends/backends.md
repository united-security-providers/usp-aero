---
title: "Backends"
weight: 10
---

# Backends

This screen offers management of WAF target backend servers. A backend server is a web server
providing a web application over HTTP(s) or WebSocket. A remote authentication server or an ICAP
server is also represented as a backend server. Backend servers can be assigned to
[routes](../vhosts/routes/routes).

A backend server consists of a name, a list of endpoints and SSL/TLS settings for encryption of data
which is transported between the Aero WAAP and the backend server. Having multiple endpoints defined
will activate load-balancing between them.

## List of backends

### Name {#name-column}

The backend's name.

- **Values:** text

### Address {#address-column}

The backend's endpoint address(es).

- **Values:** text

### TLS {#tls}

Whether a TLS connection to the backend is configured on the backend's [TLS tab](tls).

### Actions {#actions}

Open a backend's details ("Edit" or, in read-only mode, "Details"), or delete it. Deleting a backend
is not possible while it is still referenced by a route.

### Add Backend {#addBackendButton}

Creates a new backend.

## Tab "Settings"

### Name {#name}

The name is a label for the backend, just visible in the configuration.

- **Values:** text of at most 253 characters, written as one or more dot-separated labels of letters,
  digits, spaces and hyphens
- **Required:** yes

### Backend endpoints {#backendEndpoints}

A backend endpoint consists of an IP address and port, as well as an optional host header value.
IPv4 and IPv6 are supported (given matching network interface configuration). More than one endpoint
can be added by clicking the "+" icon, up to 256. If multiple endpoints are configured for the
backend, various types of load-balancing can be enabled for them (see below).

### Address {#address}

The backend endpoint's IP address or hostname.

- **Values:** [IP address](../../value-types#ip-address) or [hostname](../../value-types#hostname)
- **Required:** yes

### Port {#port}

The backend endpoint's port.

- **Values:** [port](../../value-types#port)
- **Required:** yes

### Host Header {#hostHeader}

The value sent as the `Host` header to this backend endpoint with every request.

- **Values:** a lowercase hostname of at most 253 characters, optionally starting with `*.` for a
  wildcard
- **Default:** none

### Load Balancer {#loadBalancer}

There are several different types of load-balancing available:

- **Least Request**
- **Random** - Requests are distributed to the endpoints in a random fashion.
- **Round Robin** - Each new request is forwarded to another endpoint until each endpoint was used,
  then it starts again with the first one.
- **Consistent Hash**

- **Values:** `Least Request`, `Random`, `Round Robin` or `Consistent Hash`
- **Default:** `Least Request`

### Backend Stickiness {#backendStickiness}

If enabled, all requests coming from one client will be sent to the same backend endpoint.

- **Values:** `on` or `off`
- **Default:** `off`

### Used in {#used-in}

Shows the virtual hosts and routes that reference this backend.
