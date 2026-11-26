---
title: "Timeouts & Limits"
weight: 30
---

# Timeouts & Limits

Timeout and limit settings of a listener. All of them are mandatory. A new listener starts with the
defaults given below.

## Timeouts

### Connection Acceptance Timeout {#connectionAcceptanceTimeout}

How long the initial inspection of an incoming connection on the listener socket may take. This
covers TLS/SNI and protocol detection, or HTTP protocol parsing. A connection that is not inspected in time is
dropped. This happens before a virtual host has been selected, so the client receives no HTTP
response.

- **Values:** [duration](../../value-types#duration)
- **Default:** `2s`
- **Required:** yes

### TLS Handshake Timeout {#tlsHandshakeTimeout}

How long the TLS handshake may take once a connection has been accepted. A connection whose
handshake is not complete when this expires is closed, again without an HTTP response.

- **Values:** [duration](../../value-types#duration)
- **Default:** `2s`
- **Required:** yes

### Connection Maximum Duration {#maxConnectionDuration}

The maximum amount of time a connection can remain established (usually via TCP/HTTP keepalive
packets) before being drained and closed.

- **Values:** [duration](../../value-types#duration)
- **Default:** `600s`
- **Required:** yes

### Connection Idle Timeout {#httpConnectionIdleTimeout}

The idle timeout for an HTTP connection. Idle time is a period in which there are no active requests
on the connection.

- **Values:** [duration](../../value-types#duration)
- **Default:** `300s`
- **Required:** yes

### Stream Idle Timeout {#streamIdleTimeout}

The amount of time a stream can exist without any upstream or downstream activity.

- **Values:** [duration](../../value-types#duration)
- **Default:** `60s`
- **Required:** yes

### Request Headers Received Timeout {#requestHeadersReceivedTimeout}

How long the complete header block of a request may take to arrive. The timer starts with the first
byte of the headers and stops with the last one; if it expires, Aero WAAP answers `408 Request Timeout`
and closes the connection.

- **Values:** [duration](../../value-types#duration)
- **Default:** `10s`
- **Required:** yes

### Request Total Received Timeout {#requestTotalReceivedTimeout}

How long Aero WAAP waits for the complete reception of a request. The timer starts when the request
begins and stops when either the last byte of the request is sent upstream or the response begins.

- **Values:** [duration](../../value-types#duration)
- **Default:** `10s`
- **Required:** yes

## Connection Limits

### Maximum Concurrent Connections {#maxConcurrentConnections}

The maximum number of connections this listener holds open at the same time. Connections beyond the
limit are closed. The limit is shared by every virtual host bound to this listener.

- **Values:** a whole number of 1 or more
- **Default:** `4096`
- **Required:** yes

### Maximum Concurrent HTTP/2 Streams {#maxConcurrentHttpTwoStreams}

The maximum number of concurrent HTTP/2 streams allowed per connection.

- **Values:** a whole number of 1 or more
- **Default:** `1024`
- **Required:** yes

### Connection Buffer Limit {#connectionBufferLimit}

The maximum buffer size for each incoming connection.

- **Values:** [quantity](../../value-types#quantity)
- **Default:** `32Ki` (32768 bytes)
- **Required:** yes

## Comment {#comments}

Free text about the listener's timeouts and limits. It is only shown in the configuration.

- **Values:** text
- **Default:** none
