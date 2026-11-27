---
title: "API"
weight: 15
---

# Management API

Everything the management GUI does is a call to the management API. Scripts, CI pipelines and other
machines can make the same calls with an [API client](../gui/user-management/api-clients).

This page describes the API of the Aero Platform. The installed components have APIs of their own,
for example [Aero WAAP](../../../../waap/latest/reference/api/).

[Endpoints](#endpoints), at the end of this page, lists every endpoint with its parameters, request
and response bodies, generated from the release this documentation belongs to. It can also
[prepare requests](#try-it-out) for your appliance.

## Try it out {#try-it-out}

[Endpoints](#endpoints) can prepare a request for your appliance:

1. In [Endpoints](#endpoints), enter the address of your appliance as `baseUri`.
2. Click "Authorize" and enter a token, see [Get a token](../../operations/api/access-the-management-api#get-a-token).
3. Open an operation, click "Try it out", fill in the parameters and click "Execute".

Swagger UI then shows the request as a `curl` command, ready to run in a shell. Your browser sends the
request directly to the appliance, not through the documentation site. The appliance doesn't accept
requests from pages of other sites, so the browser blocks it and reports "Failed to fetch"; run the
`curl` command instead.

## Prerequisites {#prerequisites}

1. The appliance is [installed](../../install/installation) and the
   [first-time setup](../../install/firsttimewizard) is complete.
2. An administrator has [created an API client](../../operations/api/access-the-management-api#create-an-api-client)
   and deployed the change.
3. The caller has [requested a token](../../operations/api/access-the-management-api#get-a-token) for it.

## Base URL {#base-url}

```
https://<appliance>/api/
```

`<appliance>` is the host name or IP address you open the management GUI with. In an HA cluster,
use the cluster's address, see
[HA clusters](../../operations/api/access-the-management-api#ha-clusters). In [Endpoints](#endpoints),
enter it as `baseUri`, for example `https://aero.example.com`, and the token under
"Authorize".

## Authentication {#authentication}

Every request carries the access token of an API client:

```
Authorization: Bearer <token>
```

Its role decides what the client may do, as for a person with the same role, with a few exceptions,
see [Roles and permissions](../../concepts/roles-and-permissions#api-clients).

## Requests and responses {#requests-and-responses}

- Request and response bodies are JSON (`application/json`), unless the reference names another
  media type for an operation: file uploads use `multipart/form-data`, downloads return the file.
- Changing a setting stores it as a **draft change**, exactly as saving it in the GUI does. It takes
  effect only after a revision has been created and deployed, see
  [Configuration lifecycle](../../concepts/configuration-lifecycle) and
  [Apply configuration changes](../../operations/api/access-the-management-api#apply-configuration-changes).
- Deploying runs in the background: the request returns as soon as the deployment has started.

## Status codes {#status-codes}

| Status | Meaning |
|---|---|
| `200`, `201`, `204` | The request succeeded. |
| `400` | The request is malformed, or it refers to an object that doesn't exist. The body is `{"reason": "…"}`. |
| `401` | The token is missing, expired or invalid. Request a new one. |
| `403` | The client's role doesn't allow the operation. |
| `417` | The operation isn't possible in the current state of the appliance. The body is `{"reason": "…"}`. |
| `422` | The request body is invalid. The body lists every violation: `{"violations": [{"fieldName": "…", "message": "…"}]}`. |
| `503` | A service the operation needs, for example the configuration storage, is not available. Retry later. |

## Endpoints {#endpoints}

{{< api-reference >}}
