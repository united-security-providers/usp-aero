---
title: "Timeouts & Limits"
weight: 30
---

# Timeouts & Limits

Timeout and limit settings of a listener. All of them are mandatory: a listener always has a value
for each, and creating a listener starts from the defaults given below.

## Timeouts

### Connection Acceptance Timeout {#connectionAcceptanceTimeout}

*Not yet documented.*

- **Values:** [duration](../value-types#duration)
- **Default:** `2s`

### TLS Handshake Timeout {#tlsHandshakeTimeout}

*Not yet documented.*

- **Values:** [duration](../value-types#duration)
- **Default:** `2s`

### Connection Maximum Duration {#maxConnectionDuration}

The maximum amount of time a connection can remain established (usually via TCP/HTTP keepalive
packets) before being drained and closed.

- **Values:** [duration](../value-types#duration)
- **Default:** `600s`

### Connection Idle Timeout {#httpConnectionIdleTimeout}

The idle timeout for an HTTP connection. Idle time is a period in which there are no active requests
on the connection.

- **Values:** [duration](../value-types#duration)
- **Default:** `300s`

### Stream Idle Timeout {#streamIdleTimeout}

The amount of time a stream can exist without any upstream or downstream activity.

- **Values:** [duration](../value-types#duration)
- **Default:** `60s`

### Request Headers Received Timeout {#requestHeadersReceivedTimeout}

*Not yet documented.*

- **Values:** [duration](../value-types#duration)
- **Default:** `10s`

### Request Total Received Timeout {#requestTotalReceivedTimeout}

How long WAAP waits for the complete reception of a request. The timer starts when the request
begins and stops when either the last byte of the request is sent upstream or the response begins.

- **Values:** [duration](../value-types#duration)
- **Default:** `10s`

## Connection Limits

### Maximum Concurrent Connections {#maxConcurrentConnections}

*Not yet documented.*

- **Values:** a whole number of 1 or more
- **Default:** `4096`

### Maximum Concurrent HTTP/2 Streams {#maxConcurrentHttpTwoStreams}

The maximum number of concurrent HTTP/2 streams allowed per connection.

- **Values:** a whole number of 1 or more
- **Default:** `1024`

### Connection Buffer Limit {#connectionBufferLimit}

The maximum buffer size for each incoming connection.

- **Values:** [quantity](../value-types#quantity)
- **Default:** `32Ki` (32768 bytes)
