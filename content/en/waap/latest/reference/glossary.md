---
title: "Glossary"
weight: 70
---

# Glossary

### Listener

Accepts incoming TCP/TLS connections on an IP address and port. See
[Listeners](listeners/listeners).

### Virtual Host

Represents a single domain name reachable through a listener. See
[Virtual Hosts](vhosts/virtual-hosts).

### Route

A rule within a virtual host that matches a request by path and headers and forwards it to a
backend. See [Routes](vhosts/routes/routes).

### Backend

An upstream application server (or servers) that a route forwards matched requests to. See
[Backends](backends/backends).

### CRS

The Core Rule Set, the set of Coraza rules used by the [Rule Engine](vhosts/rule-engine) to detect
common web application attacks.

### Paranoia Level

How aggressively the Core Rule Set scans requests and responses. A higher level detects more, at the
cost of more false positives. See [Rule Engine](vhosts/rule-engine).
