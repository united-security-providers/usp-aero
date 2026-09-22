> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Glossary

### Listener

Accepts incoming TCP/TLS connections on an IP address and port. See
[Listeners](gui/listeners/listeners).

### Virtual Host

Represents a single domain name reachable through a listener. See
[Virtual Hosts](gui/vhosts/virtual-hosts).

### Route

A rule within a virtual host that matches a request by path and headers and forwards it to a
backend. See [Routes](gui/vhosts/routes/routes).

### Backend

An upstream application server (or servers) that a route forwards matched requests to. See
[Backends](gui/backends/backends).

### CRS

The Core Rule Set, the set of Coraza rules used by the [Rule Engine](gui/vhosts/rule-engine) to detect
common web application attacks.

### Paranoia Level

How aggressively the Core Rule Set scans requests and responses. A higher level detects more, at the
cost of more false positives. See [Rule Engine](gui/vhosts/rule-engine).
