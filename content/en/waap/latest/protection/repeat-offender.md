---
title: "Repeat offender"
weight: 30
---

# Repeat offender

Repeat Offender Detection blocks a client once it triggers too many violations in a short time,
instead of judging each request in isolation. Use it against a client that keeps retrying a request
the [Rule Engine](../reference/gui/vhosts/rule-engine) keeps rejecting, or that keeps generating errors -
typical of scanners and automated attack tools - while leaving well-behaved clients untouched.

## Configure detection

1. Open the virtual host's [Rate Limiting](../reference/gui/vhosts/rate-limiting) tab and turn on Repeat
   Offender Detection.
2. Under Violations, set the Status codes counted as violation (single codes or ranges such as
   `4xx`), the Counting period the count resets after, and the Allowed violations a client gets
   before it is blocked. Set the Status code when blocked.
3. Under Client Identification, set the Status code if client not identified, and list any Client
   IPs excluded from detection - for example your own monitoring or a load balancer's health-check
   address.
4. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle).

> [!IMPORTANT]
> An excluded IP is removed from detection entirely. Excluding a shared address, such as a NAT
> gateway or a reverse proxy in front of many clients, defeats the protection for everyone behind it.

## Related

- [(D)DoS protection](ddos-protection)
- [Rate Limiting](../reference/gui/vhosts/rate-limiting)