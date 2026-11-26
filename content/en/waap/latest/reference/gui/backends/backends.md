---
title: "Backends"
weight: 10
---

# Backends

This screen manages the backend servers that Aero WAAP forwards requests to. A backend server is a
web server providing a web application over HTTP(S) or WebSocket. Backend servers are assigned to
[routes](../vhosts/routes/routes).

A backend consists of a name, a list of endpoints, and TLS settings for the connection between Aero
WAAP and the backend server. With more than one endpoint, the requests are load-balanced between
them.

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

### Backend Endpoints {#backendEndpoints}

A backend endpoint consists of an address and a port, and an optional host header value. At least
one endpoint is required, and up to 256 can be added with the "+" icon. The endpoints of one backend
are either all IP addresses or all hostnames. With more than one endpoint, the
[Load Balancer](#loadBalancer) distributes the requests between them.

### Address {#address}

The backend endpoint's IP address or hostname. IPv6 addresses are only accepted when IPv6 support
is enabled.

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

How the requests are distributed between the backend's endpoints.

- **Least Request** - Two healthy endpoints are picked at random. The request goes to the one with
  fewer active requests.
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

## Comments {#comments}

Free text about the backend's settings. It is only shown in the configuration.

- **Values:** text
- **Default:** none
