---
title: "Rate Limiting"
weight: 40
aliases:
  - /waap/latest/reference/vhosts/rate-limiting/
---

# Rate Limiting

## Repeat Offender Detection {#enabled}

Blocks clients that repeatedly trigger violations (such as being rejected by the
[Rule Engine](rule-engine)) for a configured period of time.

- **Values:** `on` or `off`
- **Default:** `off`

## Client Identification

Clients are tracked using a client identifier. If the identifying header is missing from a request,
the configured status code is sent to the client instead.

### Status Code If Client Not Identified {#clientIdMissingStatusCode}

Sent when the client ID header is missing.

- **Values:** a number from `100` to `599`
- **Default:** `403`
- **Required:** yes

### Client IPs Excluded From Detection {#excludedClientIPs}

IP addresses that are never subject to repeat-offender blocking.

- **Values:** a list of IPv4 addresses
- **Default:** none

## Violations

### Status Codes Counted As Violation {#httpCodesToObserve}

The response status codes (or ranges, e.g. `4xx`) that count as a violation for a client.

- **Values:** a list of status codes or ranges, e.g. `404` or `4xx`
- **Default:** none

### Counting Period {#violationsCounterResetDuration}

Resets the violation counter after this duration.

- **Values:** a number of seconds, at least `1`
- **Default:** `60`
- **Required:** yes

### Allowed Violations {#maximumAllowedViolations}

The client is blocked once its violation count exceeds this number within the counting period.

- **Values:** a number from `1` to `65535`
- **Default:** `10`
- **Required:** yes

### Status Code When Blocked {#maximumViolationsLimitExceededStatusCode}

Sent to the client while it is blocked.

- **Values:** a number from `100` to `599`
- **Default:** `429`
- **Required:** yes
