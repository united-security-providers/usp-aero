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

## New features and improvements

*

## Bug fixes

*

## Incompatible behavior changes

*

## Removed config or runtime

*

## Known Issues

*
-->

## 1.0.0 - 2026-09-01

### Contents

- Aero Management Feature WAAP UI: 1.0.1
- Aero WAAP Gateway: 0.5.0
- WAAP Extension Server for Gateway: 0.7.0
- Aero WAAP Acme: 1.0.0

This is the first official release allowing to get familiar with how the platform works.

## New features and improvements

* Repeat offender blocking feature added
* Added additional timeout and limit settings for better resource control an (D)DoS prevention
* Improved and streamlined route-based request size enforcement
* Added cookie manipulation capability
* Security response header management
* Static content management and delivery as preparation for local error pages
* New header filter class `EXTENDED`
* Updated to Envoy Gateway v1.9.1

## Bug fixes

* Various validation fixes to ensure configuration compatibility to the Gateway API.
* Fixed read-only viewer role access enforcement.
* Fixed allowed HTTP method ui element, so moving items works as expected
* ACME client now creates self-signed temporary certificate only, when there is no old certificate available
* Fixed ACME client error recovery/retry, when certificate order did not succeed  
* Fixed Coraza logging for phase 3-5

## Removed config or runtime

* Removed header filter class `MINIMAL`

## Known Issues

* ACME `key type` is ignored
* Backend load-balancing `Consisten Hash` doesn't work as expected

## 0.5.0 - 2026-06-03

### Contents

- Aero Management Feature WAAP UI: 0.5.0
- Aero WAAP Gateway: 0.1.0
- WAAP Extension Server for Gateway: 0.1.0
- Aero WAAP Acme: 0.6.0

This is the first unofficial release allowing to get familiar with how the platform works.

## New features and improvements

* Basic Revere Proxy capabilities Backend routing, Request redirect and translation
* TLS Termination with quantum-safe cipher support, mTLS with clients and backends
* TLS certificate handling with ACME protocol
* OWASP Coraza Rule Engine & OWASP Core Rule Set support with rule exception support and virtual patching capability.
* Access control enforcement based on IP address
* Allowed HTTP method restriction
* Header filtering and header manipulation capability
