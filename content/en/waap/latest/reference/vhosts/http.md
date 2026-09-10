---
title: "HTTP"
weight: 20
---

# HTTP

## HTTP Protocols

Select which HTTP protocol versions (HTTP/1.1, HTTP/2, HTTP/3) this virtual host accepts. At least
one protocol must be selected.

## Timeouts

Connection Idle Timeout, Request Timeout, Request Received Timeout and Stream Idle Timeout, scoped
to this virtual host. See the listener's [Timeouts & Limits](../listeners/timeouts-and-limits) for
the equivalent connection-level settings.

## Connection Limits

Buffer Limit, Max concurrent HTTP Connections and Max concurrent HTTP/2 Streams, scoped to this
virtual host.
