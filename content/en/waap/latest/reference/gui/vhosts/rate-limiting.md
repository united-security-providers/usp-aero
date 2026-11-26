---
title: "Rate Limiting"
weight: 70
---

# Rate Limiting

## Repeat Offender Detection {#enabled}

Blocks clients that repeatedly trigger violations (such as being rejected by the
[Rule Engine](rule-engine)) for a configured period of time. See
[Repeat offender](../../../protection/repeat-offender) for how detection works.

Switching it off discards all settings below.

- **Values:** `on` or `off`
- **Default:** `off`

## Client Identification

Clients are tracked by a client identifier. See
[How a client is identified](../../../protection/repeat-offender#how-a-client-is-identified).

### Client IPs Excluded From Detection {#excludedClientIPs}

Client IP addresses that are never subject to repeat-offender blocking. Each entry is compared with
the client IP address, not with the client identifier.

- **Values:** a list of IPv4 or IPv6 addresses or [CIDR ranges](../../value-types#cidr)
- **Default:** none

## Violations

### Status Codes Counted As Violation {#httpCodesToObserve}

The response status codes (or ranges, e.g. `4xx`) that count as a violation for a client.

- **Values:** a list of status codes or ranges from `100` to `599`, e.g. `404` or `4xx`
- **Default:** `4xx`, `5xx`
- **Required:** yes, at least one entry

### Counting Period {#violationsCounterResetDuration}

Resets the violation counter after this duration. The same duration is how long a client stays
blocked.

- **Values:** a [duration](../../value-types#duration) of at least `1s`
- **Default:** `60s`
- **Required:** yes

### Allowed Violations {#maximumAllowedViolations}

The client is blocked as soon as its violation count reaches this number within the counting period.

- **Values:** a number from `1` to `65535`
- **Default:** `10`
- **Required:** yes

### Status Code When Blocked {#maximumViolationsLimitExceededStatusCode}

Sent to the client while it is blocked.

- **Values:** a number from `100` to `599`
- **Default:** `429`
- **Required:** yes

## Comments {#comments}

Free text about the virtual host's rate limiting. It is only shown in the configuration.

- **Values:** text
- **Default:** none
