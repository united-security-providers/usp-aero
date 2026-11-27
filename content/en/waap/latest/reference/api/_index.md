---
title: "API"
weight: 15
---

# Management API

Everything the Aero WAAP management GUI does is a call to its management API. Scripts, CI
pipelines and other machines can make the same calls with an
[API client](../../../../platform/latest/reference/gui/user-management/api-clients) of the Aero
Platform.

[Endpoints](#endpoints), at the end of this page, lists every endpoint with its parameters, request
and response bodies, generated from the release this documentation belongs to. It can also
[prepare requests](#try-it-out) for your appliance.

## Try it out {#try-it-out}

[Endpoints](#endpoints) can prepare a request for your appliance:

1. In [Endpoints](#endpoints), enter the address of your appliance as `baseUri`.
2. Click "Authorize" and enter a token, see [Get a token](../../../../platform/latest/operations/api/access-the-management-api#get-a-token).
3. Open an operation, click "Try it out", fill in the parameters and click "Execute".

Swagger UI then shows the request as a `curl` command, ready to run in a shell. Your browser sends the
request directly to the appliance, not through the documentation site. The appliance doesn't accept
requests from pages of other sites, so the browser blocks it and reports "Failed to fetch"; run the
`curl` command instead.

## Prerequisites {#prerequisites}

1. Aero WAAP is [installed](../../../../platform/latest/operations/components/install-a-component)
   on the appliance.
2. An API client exists and the caller has a token for it. Aero WAAP accepts the same tokens as the
   Aero Platform, see
   [Access the management API](../../../../platform/latest/operations/api/access-the-management-api).

## Base URL {#base-url}

```
https://<appliance>/component/waap/api/
```

`<appliance>` is the host name or IP address you open the management GUI with. In [Endpoints](#endpoints),
enter it as `baseUri`, for example `https://aero.example.com`; the path
`/component/waap` is added to it.

## Authentication {#authentication}

Every request carries the access token of an API client:

```
Authorization: Bearer <token>
```

Its role decides what the client may do: `Viewer` reads, `Administrator` also changes the
configuration.

## Requests and responses {#requests-and-responses}

- Request and response bodies are JSON (`application/json`), unless the reference names another
  media type for an operation: file uploads use `multipart/form-data`, downloads return the file.
- Changing a setting stores it as a **draft change** of the component `waap`, exactly as saving it in
  the GUI does. It takes effect only after a revision has been created and deployed, through the
  API of the Aero Platform, see
  [Apply configuration changes](../../../../platform/latest/operations/api/access-the-management-api#apply-configuration-changes).

## Status codes {#status-codes}

The status codes are the same as those of the
[Aero Platform API](../../../../platform/latest/reference/api/#status-codes).

## Endpoints {#endpoints}

{{< api-reference >}}
