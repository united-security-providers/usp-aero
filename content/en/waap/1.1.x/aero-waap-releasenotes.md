---
title: "Release Notes"
weight: 20
---

# Aero WAAP Release Notes
<!--
## x.x.x - 202x-xx-xx

### Contents

- Aero Management Feature WAAP UI: x.x.x
- Aero WAAP Gateway: x.x.x
- WAAP Extension Server for Gateway: x.x.x
- Aero WAAP Acme: x.x.x

### New features and improvements

*

### Bug fixes

*

### Incompatible behavior changes

*

### Removed config or runtime

*

### Known Issues

*
-->

## 1.1.0 - 2026-11-20

### Contents

- Aero Management Feature WAAP UI: 1.1.4
- Aero WAAP Gateway: 0.7.3
- WAAP Extension Server for Gateway: 0.9.3
- Aero WAAP Acme: 1.0.1

### New features and improvements

* Local error pages: serve a custom page when the backend responds with a given status code or status class,
  optionally narrowed by response header conditions and with an overwritten status code
* Maintenance pages: serve a local page with a configurable status code on selected or all routes of a virtual host,
  without contacting the backend
* Error and maintenance page content supports response variables such as `%RESPONSE_CODE%`; single files or all files
  can be uploaded and downloaded as an archive
* Header validation with `Detect` and `Block` modes and exceptions
* Cookie manipulation offers the known cookie attributes, including the valueless attributes `Secure`, `HttpOnly` and
  `Partitioned`, and checks their values
* Repeat offender: IP exclusions accept IPv4 and IPv6 addresses and CIDR ranges, violations are counted per virtual host
* Request body size limits above 1 GB are possible when the Rule Engine does not inspect the request body
* Hint when an ACME provider is used on a listener without the standard ports 80 or 443
* Updated the rule list of the Rule Engine to OWASP Core Rule Set 4.25.2

### Bug fixes

* Virtual hosts sharing a hostname no longer silently receive the same certificate; such configurations are now rejected
  (see Incompatible behavior changes)
* Duplicate route names are reported in the virtual host editor
* Saving an unchanged route no longer reorders its allowed HTTP methods and shows a change in the revision diff
* The repeat offender status codes counted as violation can no longer be empty

### Incompatible behavior changes

* Request and response body size limits must be at least 1 KB
* Virtual hosts on the same listener must use distinct hostnames, and virtual hosts sharing a hostname must use the same
  certificate or ACME provider
* A `%` in error page content must start a known response variable or be written as `%%`

### Removed config or runtime

* Removed the repeat offender setting "Status Code If Client Not Identified"

### Known Issues

* The configured request body size limit may be enforced one byte differently than specified.
  This affects only requests whose body size is exactly at the limit.

## 1.0.0 - 2026-09-01

### Contents

- Aero Management Feature WAAP UI: 1.0.1
- Aero WAAP Gateway: 0.5.0
- WAAP Extension Server for Gateway: 0.7.0
- Aero WAAP Acme: 1.0.0

This is the first official release allowing to get familiar with how the platform works.

### New features and improvements

* Repeat offender blocking feature added
* Added additional timeout and limit settings for better resource control an (D)DoS prevention
* Improved and streamlined route-based request size enforcement
* Added cookie manipulation capability
* Security response header management
* Static content management and delivery as preparation for local error pages
* New header filter class `EXTENDED`
* Updated to Envoy Gateway v1.9.1

### Bug fixes

* Various validation fixes to ensure configuration compatibility to the Gateway API.
* Fixed read-only viewer role access enforcement.
* Fixed allowed HTTP method ui element, so moving items works as expected
* ACME client now creates self-signed temporary certificate only, when there is no old certificate available
* Fixed ACME client error recovery/retry, when certificate order did not succeed
* Fixed Coraza logging for phase 3-5

### Removed config or runtime

* Removed header filter class `MINIMAL`

### Known Issues

* ACME `key type` is ignored
* Backend load-balancing `Consisten Hash` doesn't work as expected

## 0.5.0 - 2026-06-03

### Contents

- Aero Management Feature WAAP UI: 0.5.0
- Aero WAAP Gateway: 0.1.0
- WAAP Extension Server for Gateway: 0.1.0
- Aero WAAP Acme: 0.6.0

This is the first unofficial release allowing to get familiar with how the platform works.

### New features and improvements

* Basic Revere Proxy capabilities Backend routing, Request redirect and translation
* TLS Termination with quantum-safe cipher support, mTLS with clients and backends
* TLS certificate handling with ACME protocol
* OWASP Coraza Rule Engine & OWASP Core Rule Set support with rule exception support and virtual patching capability.
* Access control enforcement based on IP address
* Allowed HTTP method restriction
* Header filtering and header manipulation capability
