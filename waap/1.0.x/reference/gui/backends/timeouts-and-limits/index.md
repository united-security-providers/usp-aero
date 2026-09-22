> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Timeouts & Limits

Timeout and circuit-breaking settings for the connection between Aero WAAP and the endpoints of this
backend. All of them are mandatory: a backend always has a value for each, and creating a backend
starts from the defaults given below.

## Timeouts

### Connection Timeout {#connectionTimeout}

How long establishing a connection to a backend endpoint may take, including the TCP and, where TLS
is used, the TLS handshake. An attempt that is not complete when this expires is aborted.

- **Values:** [duration](../../value-types#duration)
- **Default:** `10s`

### Connection Idle Timeout {#connectionIdleTimeout}

The idle timeout for an established connection to a backend endpoint. Idle time is a period in which
there are no active requests on the connection; once it expires, the connection is closed. Because no
request is in flight at that moment, this is not visible to a client.

- **Values:** [duration](../../value-types#duration)
- **Default:** `60s`

## Circuit Breaking

Upper bounds on what this backend may be asked to handle, so that a slow or overloaded backend cannot
tie up unlimited resources on the appliance. A request that exceeds any of them is answered with
`503 Service Unavailable` without reaching the backend.

Each limit is counted across all endpoints of the backend together, not per endpoint. The limits are
applied separately for every route that uses this backend: two routes pointing at the same backend
each get these values in full, rather than sharing them.

### Maximum Connections {#maxConnections}

The maximum number of connections established to this backend at the same time.

- **Values:** a whole number of 1 or more
- **Default:** `10240`

### Maximum HTTP Pending Requests {#maxPendingRequests}

The maximum number of requests queued while waiting for a connection to the backend to become
available. Once the queue is full, further requests are rejected instead of being queued.

- **Values:** a whole number of 1 or more
- **Default:** `10240`

### Maximum Parallel Requests {#maxParallelRequests}

The maximum number of requests in flight to this backend at the same time - requests that have been
sent and are waiting for a response.

- **Values:** a whole number of 1 or more
- **Default:** `10240`
