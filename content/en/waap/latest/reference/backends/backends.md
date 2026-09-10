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

## Tab "Settings"

### Name

The name is a label for the backend, just visible in the configuration.

### Backend endpoints

A backend endpoint consists of an IP address and port, as well as an optional host header value.
IPv4 and IPv6 are supported (given matching network interface configuration).

The "Host Header" field defines the value for the "Host" header sent to the backend endpoint with
every request.

More than one endpoint can be added by clicking the "+" icon. If multiple endpoints are configured
for the backend, various types of load-balancing can be enabled for them (see below).

### Load Balancer

There are several different types of load-balancing available:

- **Least Request**
- **Random** - Requests are distributed to the endpoints in a random fashion.
- **Round Robin** - Each new request is forwarded to another endpoint until each endpoint was used,
  then it starts again with the first one.
- **Consistent Hash**

### Backend Stickiness

If enabled, all requests coming from one client will be sent to the same backend endpoint.
