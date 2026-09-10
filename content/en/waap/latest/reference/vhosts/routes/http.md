---
title: "HTTP"
weight: 20
---

# HTTP

## Allowed Methods

Defines the HTTP methods to allow. Requests with other HTTP methods are rejected with status code
`405 Method Not Allowed`. The list of available methods on the left shows all
[IANA HTTP Methods](https://www.iana.org/assignments/http-methods/http-methods.xhtml). By default
`GET`, `HEAD`, `OPTIONS` and `POST` are allowed, as shown in the list of selected methods on the
right. Move methods left and right as desired and save.

## Request Body Inspection

### Maximum payload size

The maximum size of the request body that will be inspected.

### Disable rule engine for body payload

If enabled, all [Rule Engine](../rule-engine) rules that inspect or parse the request body
are inactive and will be skipped for this route.
