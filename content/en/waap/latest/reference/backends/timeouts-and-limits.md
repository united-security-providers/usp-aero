---
title: "Timeouts & Limits"
weight: 40
---

# Timeouts & Limits

Timeout and circuit-breaking settings for the connection between WAAP and the endpoints of this
backend. All of them are mandatory: a backend always has a value for each, and creating a backend
starts from the defaults given below.

## Timeouts

### Connection Timeout {#connectionTimeout}

*Not yet documented.*

- **Values:** [duration](../value-types#duration)
- **Default:** `10s`

### Connection Idle Timeout {#connectionIdleTimeout}

*Not yet documented.*

- **Values:** [duration](../value-types#duration)
- **Default:** `60s`

## Circuit Breaking

### Maximum Connections {#maxConnections}

*Not yet documented.*

- **Values:** a whole number of 1 or more
- **Default:** `10240`

### Maximum HTTP Pending Requests {#maxPendingRequests}

*Not yet documented.*

- **Values:** a whole number of 1 or more
- **Default:** `10240`

### Maximum Parallel Requests {#maxParallelRequests}

*Not yet documented.*

- **Values:** a whole number of 1 or more
- **Default:** `10240`
