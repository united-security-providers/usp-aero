> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# How a request is processed

Every request handled by Aero WAAP passes through the same chain of configuration objects. The
other reference pages in this manual each document one link of this chain. This page is the map.

## Listener → Virtual Host → Route → Backend

1. **[Listener](../reference/gui/listeners/listeners)**: accepts the incoming TCP/TLS connection on a configured
   IP address and port. Its own settings cover TLS termination and connection-level timeouts and
   limits.
2. **[Virtual Host](../reference/gui/vhosts/virtual-hosts)**: one listener can carry several virtual hosts. The
   incoming hostname (and the listener's certificate) selects which one handles the request. The
   virtual host is also where the [Rule Engine](../reference/gui/vhosts/rule-engine) (the Coraza/CRS security
   filter) and [Rate Limiting](../reference/gui/vhosts/rate-limiting) (repeat-offender detection) are configured —
   both apply to every route underneath it.
3. **[Route](../reference/gui/vhosts/routes/routes)**: within a virtual host, the request path and headers are
   matched against the configured routes to pick one. A route also carries its own HTTP method
   restrictions, header and cookie manipulation, access control, and redirect/translation rules.
4. **[Backend](../reference/gui/backends/backends)**: the route's matched request is finally forwarded to the
   backend it references: one or more upstream endpoints, with their own load-balancing, TLS and
   health-check settings.

## Local files

[Static Content](../reference/gui/local-files/static-content) <!-- and [Local Error Pages](../reference/gui/local-files/error-pages) -->
are files stored on the appliance itself rather than on an upstream backend. <!-- A virtual host's
[Error Pages](../reference/gui/vhosts/error-pages) tab can serve a local error page instead of forwarding a failed -->
request to a backend.

## Where TLS material comes from

Certificates and CA certificates used by listeners, virtual hosts and backends are all managed
centrally under [Certificates](../reference/gui/certificates/certificates-and-keys) including ACME
provider settings for automated certificate renewal.
