> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Repeat offender

Repeat Offender Detection blocks a client once it triggers too many violations in a short time,
instead of judging each request in isolation. Use it against a client that keeps retrying a request
the [Rule Engine](../reference/gui/vhosts/rule-engine) keeps rejecting, or that keeps generating errors.
This is typical for scanners and automated attack tools.

It is not a request rate limit. A client whose responses are never counted as a violation is never
blocked, however fast it sends.

## How detection works

- A violation is a response to the client whose status code is in
  [Status Codes Counted As Violation](../reference/gui/vhosts/rate-limiting#httpCodesToObserve).
  Rule Engine blocks are `403` and therefore count with the default `4xx`.
- Counting starts with a client's first violation and runs for the
  [Counting Period](../reference/gui/vhosts/rate-limiting#violationsCounterResetDuration).
- Once the client's count reaches
  [Allowed Violations](../reference/gui/vhosts/rate-limiting#maximumAllowedViolations)
  within that period, it is blocked immediately. Every further request is answered with
  [Status Code When Blocked](../reference/gui/vhosts/rate-limiting#maximumViolationsLimitExceededStatusCode).
- The block lasts for the
  [Counting Period](../reference/gui/vhosts/rate-limiting#violationsCounterResetDuration)
  as well. Afterwards the client is served normally again.

## How a client is identified

Violations are counted per client identifier. When the
[listener](../reference/gui/listeners/listeners#clientIpDetectionMode) uses a custom header for
client IP detection, the value of that header is the client identifier. Otherwise the client IP
address is used.

A request without a client identifier is rejected with
[Status Code If Client Not Identified](../reference/gui/vhosts/rate-limiting#clientIdMissingStatusCode)
on every virtual host that has Repeat Offender Detection enabled.

> [!WARNING]
> The protection is only as reliable as the client identifier. A client that can change its
> identifier with every request never collects enough violations to be blocked.

## Configure detection

1. Open the virtual host's [Rate Limiting](../reference/gui/vhosts/rate-limiting) tab and turn on
   [Repeat Offender Detection](../reference/gui/vhosts/rate-limiting#enabled).
2. Under [Violations](../reference/gui/vhosts/rate-limiting#violations), set the
   [Status Codes Counted As Violation](../reference/gui/vhosts/rate-limiting#httpCodesToObserve)
   (single codes or ranges such as `4xx`), the
   [Counting Period](../reference/gui/vhosts/rate-limiting#violationsCounterResetDuration), and the
   [Allowed Violations](../reference/gui/vhosts/rate-limiting#maximumAllowedViolations) a client gets before it is blocked. Set the
   [Status Code When Blocked](../reference/gui/vhosts/rate-limiting#maximumViolationsLimitExceededStatusCode).
3. Under [Client Identification](../reference/gui/vhosts/rate-limiting#client-identification), set the
   [Status Code If Client Not Identified](../reference/gui/vhosts/rate-limiting#clientIdMissingStatusCode), and list any
   [Client IPs Excluded From Detection](../reference/gui/vhosts/rate-limiting#excludedClientIPs). For example your own monitoring or
   a load balancer's health-check address.
4. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle).

> [!IMPORTANT]
> An excluded IP is removed from detection entirely. Excluding a shared address, such as a NAT
> gateway or a reverse proxy in front of many clients, defeats the protection for everyone behind it.

> [!NOTE]
> Exclusions are based on the client IP address, not on the client identifier. A client whose IP
> address is excluded is never blocked, whatever its client identifier is.

## Choose the settings

There is no detect-only mode, so a deployed configuration blocks right away. Start lenient and
tighten it once you know the traffic.

- **Status codes.** The default `4xx` and `5xx` also counts errors the client did not cause. If the
  backend fails, or [circuit breaking](../reference/gui/backends/timeouts-and-limits#circuit-breaking)
  answers `503`, every client that keeps using the site collects violations and is blocked. Where
  that is a concern, count only `4xx`, or only the codes an attacker typically produces, such as `403`
  and `404`.
- **Allowed violations and Counting period.** A browser can collect a few `404` responses on a normal
  page load, for example for a missing icon. Allow enough violations that ordinary use never reaches
  the limit within the period. A longer period also means a longer block.
- **Shared addresses.** When the client identifier is an IP address, all users behind the same
  NAT gateway or corporate proxy count as one client and are blocked together.

## Related

- [(D)DoS protection](ddos-protection)
- [Rate Limiting](../reference/gui/vhosts/rate-limiting)
