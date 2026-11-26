---
title: "Header validation"
weight: 30
---

# Header validation

Aero WAAP checks the request headers it knows against the specification that defines them, both for
their syntax and for their maximum length. By default, a request with a header that fails either check is blocked with status
code `403`. If an application legitimately needs such a header, exclude it from validation on the virtual host's
[Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab.

## Why validate headers

Every standard HTTP header has a defined format. It defines which characters the header may contain, how its value
is structured, and how long it reasonably gets. Browsers and regular clients follow these formats, so a malformed header is rarely a
typo. It usually comes from an attack tool, a scanner or a broken client.

Malformed and unexpected header values are a common way to attack a web application. Header validation rejects them
before they reach the backend, and prevents in particular:

- **Request smuggling and header injection.** Control characters and line folding inside a header value can make a
  backend split one header into several, or read a second request hidden inside the first one.
- **Abuse of client identity headers.** Headers such as `X-Forwarded-For`, `X-Real-IP`, `True-Client-IP` or
  `CF-Connecting-IP` are trusted by many applications, logging and access-control systems to identify the client,
  but any client can send them. Only values in the form of IP addresses are accepted, so these headers cannot carry
  an injection payload into the systems that trust them.
- **Bypassing security rules and routing.** Some frameworks honour headers such as `X-Original-URL` or
  `X-Rewrite-URL` and process the path given there instead of the real request path. Only an absolute URI or a path
  starting with `/` is accepted. Empty or malformed overrides are rejected.
- **Method override.** Headers such as `X-HTTP-Method-Override` let a client change the HTTP method seen by the
  application. Only a valid method name is accepted.
- **Injection into the application.** Applications often process header values, for example to log them, to build
  links from `Host` or `X-Forwarded-Host`, or to store `User-Agent` and `Referer`. Characters that do not belong in a
  header can lead to log forging, cross-site scripting or SQL injection in the backend.
- **Oversized values.** Every validated header has a maximum length. Very long values can exhaust memory or buffers
  in the backend, trigger errors that reveal internal information, or hide an attack payload behind padding.

This is useful because:

- **It protects backends that handle malformed headers badly.** Older or third-party applications are often not
  hardened against unexpected header values. Header validation ensures that they receive the validated headers only
  in their standard format.
- **It complements the Core Rule Set.** The [Core Rule Set](handle-a-crs-false-positive) looks for known attack
  patterns, which means an unknown attack can slip through. Header validation works the other way round. It accepts
  only what the specification allows and rejects everything else, without needing to know the attack.
- **It reports every failing header at once.** All headers of a request are checked before the decision is made, so
  the log lists every header that failed, not just the first one. This makes it easier to find all the exceptions an
  application needs.
- **It reduces noise.** Requests from scanners and attack tools are rejected early, before the request body is read
  and before they reach the backend and its logs.

## What is checked

- **Known headers only.** Header validation covers a defined set of headers. These are the standard HTTP headers, widely used
  de facto headers such as the `X-Forwarded-*` family, and the headers sent by modern browsers. Headers that are not
  in this set are passed through unchanged. To block or remove unknown headers, use
  [Header filtering](../header-filtering).
- **Syntax, not meaning.** A value is accepted if it has the structure the specification defines, even if it makes
  no sense. For example, `Accept-Encoding: foozip` is accepted because any token is a valid content coding, while
  `Accept: text/` is rejected because the subtype is missing. Likewise, a well-formed `X-Forwarded-For` or
  `X-Original-URL` passes even if its value is spoofed. If the application must not receive such headers at all,
  remove them with [Header filtering](../header-filtering).
- **Two checks per header.** The length check and the syntax check can be excepted separately (see
  [Allow a header that fails validation](#allow-a-header-that-fails-validation)).
- **Absent headers are fine.** Not sending a header is never a validation failure.

> [!IMPORTANT]
> Header validation checks the **format** of a header. To decide **which** headers may reach the backend at all, use [Header filtering](../header-filtering).

## Find the headers that fail validation

1. Open the virtual host, go to the [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab, and set the Header
   Validation [Mode](../../reference/gui/vhosts/rule-engine#mode) to `Detect`. Failed validations are logged, but no request is blocked.
2. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle),
   then use the application as usual.
3. Look for failed header validations in the [Live Log](../../../../platform/latest/operations/logging/live-log)
   and note which headers fail which check.

## Allow a header that fails validation

1. On the [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab, click the "+" icon in the
   [Exceptions](../../reference/gui/vhosts/rule-engine#exceptions) table of the Header Validation
   section.
2. In [Exception](../../reference/gui/vhosts/rule-engine#exception), enter the name of the header. The name alone skips both checks
   for that header. To skip only one of them, add `/syntax` or `/length` to the name, for example
   `Accept-Charset/syntax`. Skip only the check that actually fails, so the other one still protects
   the header.
3. In [Comment](../../reference/gui/vhosts/rule-engine#comments-header-validation), note why the application needs the header.
4. Set the [Mode](../../reference/gui/vhosts/rule-engine#mode) back to `Block` if you changed it.
5. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle).

## Related

- [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation)
- [Header filtering](../header-filtering)
