> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# (D)DoS protection

A flood of connections, or a single client that keeps hammering a route, can exhaust an appliance or
a site long before any application-level defense gets a chance to look at the traffic. Aero WAAP
protects against this at two levels: the listener limits how many connections and streams it
accepts at all and repeat offender detection blocks individual clients that keep triggering failures.

Both work on connections and requests that already reach the appliance. That covers the slow and
low-bandwidth attacks described below, but not volumetric floods, see
[What these settings do not stop](#what-these-settings-do-not-stop).

## Limit connections on the listener

Open the listener and go to [Timeouts & Limits](../reference/gui/listeners/timeouts-and-limits).
Set **Maximum Concurrent Connections** and **Maximum Concurrent HTTP/2 Streams** to match the traffic you expect, and check the
**Connection Buffer Limit** and the timeout values for connections that never complete or never end.

These limits apply across every virtual host carried by the listener.

> [!WARNING]
> A Maximum Concurrent Connections value set too low turns a legitimate traffic spike into an
> outage; size it from expected peak load.

## Block clients that keep failing

Open the virtual host's [Rate Limiting](../reference/gui/vhosts/rate-limiting) tab and turn on
Repeat Offender Detection. Choose which response status codes count as a violation, the counting
period, and how many violations a client is allowed before it gets blocked. See
[Repeat offender](repeat-offender) for the full walkthrough.

This does not throttle traffic by rate, it blocks a client outright once it accumulates enough
violations, which is effective against a client that keeps retrying a request that keeps failing or
getting rejected.

## What these settings stop

These are attacks that cost the attacker almost no bandwidth and work by holding resources (sockets,
handshake state, streams, buffers) hostage. They are stopped by bounding how long a connection may
stay incomplete and how many may exist at once:

- **Slowloris (slow header attack)**: many connections are opened and their request headers are sent
  a few bytes at a time, never completing, so each one keeps a connection slot. Request Headers
  Received Timeout closes a connection whose headers do not arrive in time.
  **Maximum Concurrent Connections** caps how many slots the attack can hold in total.
- **Slow POST (R.U.D.Y.)**: headers complete normally, then the body trickles in over minutes.
  **Request Total Received Timeout** bounds the request as a whole, and the route's
  [maximum payload size](request-size-limit) bounds how much of the body is accepted at all.
- **Slow read**: a large response is requested and then drained a few bytes at a time to keep the
  stream and its buffers alive. **Stream Idle Timeout** and **Connection Maximum Duration** end it.
- **Idle connection hoarding**: connections are opened, kept alive with keepalive traffic and never
  used for a request. **Connection Idle Timeout** and **Connection Maximum Duration** recycle them.
- **TLS handshake stalling**: connections are accepted but the handshake is never finished, each one
  holding a socket and handshake state.
  **Connection Acceptance Timeout** and **TLS Handshake Timeout** bound both phases.
- **Connection exhaustion from a limited number of sources**: **Maximum Concurrent Connections** caps
  how many connections exist at once, so the appliance stays responsive instead of running out of
  resources. It does not distinguish attacker from user: once the cap is reached, further
  connections are refused regardless of who opens them.
- **HTTP/2 stream flooding**: a single connection opens a very large number of concurrent streams to
  multiply its cost. **Maximum Concurrent HTTP/2 Streams** caps concurrent streams per connection. Note
  that it limits how many streams are open at the same time, not how fast streams are opened and
  cancelled, so it bounds rather than eliminates reset-based HTTP/2 attacks.
- **Per-connection memory exhaustion**: **Connection Buffer Limit** caps the buffer each connection may
  consume, which keeps worst-case memory use a predictable multiple of the connection limit.
- **Scanners, brute-force and retry storms**: a client that keeps producing rejected or failing
  requests is blocked outright by Repeat Offender Detection, before it accumulates further cost on
  the backend.

## What these settings do not stop

- **Volumetric attacks**: SYN floods, UDP or ICMP floods, and DNS/NTP amplification and reflection
  saturate the uplink and the network stack before HTTP is reached. By the time such traffic could
  be evaluated it has already consumed the bandwidth it was meant to consume. Mitigation belongs
  upstream, at the ISP or a scrubbing/CDN provider, not on the appliance.
- **Large distributed HTTP floods**: a botnet with many thousands of sources, each one staying below
  every per-client threshold and sending well-formed requests that are answered normally. No
  violation is counted and no connection stays open long enough to hit a timeout, only the aggregate
  is abusive. **Maximum Concurrent Connections** still protects the appliance from collapsing, but it
  does so by refusing legitimate users along with the flood.
- **Request rate abuse within the limits**: there is no requests-per-second limit. Repeat Offender
  Detection counts response status codes, not request rate, so a client whose requests all succeed
  can send as fast as the connection allows.
- **Expensive-endpoint abuse**: a low rate of requests to a costly operation (search, report
  generation, login with password hashing) can exhaust the backend while every connection-level
  limit stays untouched. Bound this on the backend, and set the route's
  [Timeouts](../reference/gui/vhosts/routes/timeouts) so a slow upstream does not tie up the
  connection.

## Related

- [Timeouts & Limits](../reference/gui/listeners/timeouts-and-limits)
- [Rate Limiting](../reference/gui/vhosts/rate-limiting)
- [Repeat offender](repeat-offender)
- [Limit request size](request-size-limit)
- [Route Timeouts](../reference/gui/vhosts/routes/timeouts)
- [How a request is processed](../concepts/request-flow)
