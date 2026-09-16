---
title: "OWASP Top10"
weight: 10
---

# OWASP Top10

**TODO**:
* explain security level & parnoia level
* integration with detect and security level
* move higher paranoia level

The Core Rule Set (CRS) is Aero WAAP's signature-based defense against common web application
attacks, built on the [Coraza engine](https://www.coraza.io). Its attack categories cover the kind of attacks the OWASP Top
10 web application risks describe: injection, cross-site scripting, remote code execution, and
several categories of data leakage and application-specific attacks.

## OWASP Core Rule Set (CRS)

Besides the rule categories the OWASP CRS has two important concepts:
* [Anomaly Scoring](https://coreruleset.org/docs/2-how-crs-works/2-1-anomaly_scoring/)
* [Paranoia Level](https://coreruleset.org/docs/2-how-crs-works/2-2-paranoia_levels/)

The two settings on the Rule Engine tab act on these concepts from opposite ends. The Paranoia Level
decides how many rules are evaluated at all, and so how much can be found. The Security Level decides
how much a request or response may accumulate before it is blocked: every matching rule adds points
to an anomaly score, and the level sets the score at which the request or response is rejected. The
score belonging to each level is listed under
[Security Level](../../reference/gui/vhosts/rule-engine#securityLevel).

## Turn on the Core Rule Set

Getting started with OWASP Core Rule Set often require a minimal tuning effort. The best way to get
started with is described in [Detect-only mode](../../concepts/detect-only-mode) 

## Related

- [Detect-only mode](../../concepts/detect-only-mode)
- [Rule Engine](../../reference/gui/vhosts/rule-engine)
- [Handle a CRS false positive](handle-a-crs-false-positive)
- [Virtual patching](virtual-patch)
- [How a request is processed](../../concepts/request-flow)
