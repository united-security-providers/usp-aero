---
title: "HTTP"
weight: 20
---

# HTTP

## Allowed Methods {#allowedMethods}

Defines the HTTP methods to allow. Requests with other HTTP methods are rejected with status code
`405 Method Not Allowed`. The "Blocked Methods" list on the left holds the remaining
[IANA HTTP Methods](https://www.iana.org/assignments/http-methods/http-methods.xhtml). The "Allowed
Methods" list on the right holds the allowed ones. Move methods between the lists and save.

- **Values:** any of the IANA HTTP methods (e.g. `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE`,
  `OPTIONS`, `CONNECT`, `TRACE`, and the WebDAV/versioning methods)
- **Default:** `GET`, `HEAD`, `OPTIONS`, `POST`
- **Required:** yes

## Request Body Inspection

### Maximum payload size {#bodySizeLimit}

The maximum size of the request body this route accepts. A request with a larger body is rejected
with status code `413`.

- **Values:** a [quantity](../../../value-types#quantity) of at least 1 byte, for example `10Ki`. The
  maximum is `1Gi` while the rule engine inspects the body. With
  [Disable rule engine for body payload](#bodyAccess) on, larger values are accepted.
- **Default:** `10Ki`
- **Required:** yes

### Disable rule engine for body payload {#bodyAccess}

If enabled, all [Rule Engine](../rule-engine) rules that inspect or parse the request body
are inactive and will be skipped for this route.

- **Values:** `on` or `off`
- **Default:** `off`

## Comments {#comments}

Free text about the route's HTTP settings. It is only shown in the configuration.

- **Values:** text
- **Default:** none
