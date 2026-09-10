---
title: "Health Check"
weight: 20
---

# Health Check

## Active Health Check

When health checks are enabled, backend endpoints are periodically checked for availability.

- **Check Interval** - How often the check is performed.
- **Request Timeout** - How long to wait for a check to complete.
- **Unhealthy Threshold** - How many failed checks in a row mark an endpoint unhealthy.
- **Healthy Threshold** - How many successful checks in a row mark an endpoint healthy again.

### TCP

With this option, availability is tested with just a simple TCP connection check.

### HTTP

When the "HTTP" option is selected, a URL and HTTP request method can be defined for a health check
request that will be sent to the backend to check availability, and the HTTP status code that will
be expected to signal that the backend is actually available.
