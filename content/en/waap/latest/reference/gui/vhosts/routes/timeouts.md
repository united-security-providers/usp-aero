---
title: "Timeouts"
weight: 70
---

# Timeouts

Timeout settings of a single route.

## Timeouts

### Route Total Upstream Timeout {#totalUpstreamTimeout}

The maximum time for the whole exchange with the backend on this route, covering the request being
forwarded and the response being received. A request that is not answered in time is terminated with
`504 Gateway Timeout`. Each route has its own value, independent of the other routes and of the
listener's Stream Idle Timeout.

- **Values:** [duration](../../../value-types#duration)
- **Default:** `60s`

