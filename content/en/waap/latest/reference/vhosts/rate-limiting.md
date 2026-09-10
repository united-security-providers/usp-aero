---
title: "Rate Limiting"
weight: 40
---

# Rate Limiting

## Repeat Offender Detection

Blocks clients that repeatedly trigger violations (such as being rejected by the
[Rule Engine](rule-engine)) for a configured period of time.

### Client Identification

Clients are tracked using a client identifier. If the identifying header is missing from a request,
the configured status code is sent to the client instead.

- **Client IPs excluded from detection** - IP addresses that are never subject to repeat-offender
  blocking.
- **Status code if client not identified** - Sent when the client ID header is missing.

### Violations

- **Status codes counted as violation** - The response status codes (or ranges, e.g. `4xx`) that
  count as a violation for a client.
- **Counting period** - Resets the violation counter after this duration.
- **Allowed violations** - The client is blocked once its violation count exceeds this number within
  the counting period.
- **Status code when blocked** - Sent to the client while it is blocked.
