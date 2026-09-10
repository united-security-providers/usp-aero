---
title: "Listeners"
weight: 10
---

# Listeners

Configure the HTTP listeners. A listener accepts incoming connections on an IP address and port;
see [How a request is processed](../../concepts/request-flow) for how it relates to virtual hosts,
routes and backends.

## Tab "Settings"

The Settings tab lets you define the listener's general settings and shows its assigned virtual
hosts.

### Name

A label for the listener, used to reference it in other configuration screens.

### HTTP Port / HTTPS Port

The ports the listener accepts plain HTTP and HTTPS connections on.

### IPv4 / IPv6

The IPv4 and/or IPv6 address the listener binds to.

### Custom Server header / Overwrite Server header

Allows to set or overwrite the value of the HTTP `Server` response header sent by this listener.

### Header based Client IP detection / X-Forwarded For / Number of trusted hops

Configures how the client's real IP address is determined when the listener is reached through a
trusted proxy chain, using the `X-Forwarded-For` header and the configured number of trusted hops.

### Assigned virtual hosts

Shows the virtual hosts currently assigned to this listener. Virtual hosts can only be added once
the listener itself has been created; see [Virtual Hosts](../vhosts/virtual-hosts).
