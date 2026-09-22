---
title: "Error Pages"
weight: 50
draft: true
---

# Error Pages

Configures custom error pages served by this virtual host instead of the backend's own response.
Click "Add error page" to add an entry.

### Response Status {#responseStatusCode}

The response status code (or a status class) that this entry applies to.

- **Values:** `400`, `401`, `403`, `404`, `405`, `4xx`, `500`, `501`, `502`, `503`, `504`, `505`, `5xx`
- **Default:** none
- **Required:** yes

### Local Error Page {#localErrorPageId}

The [local error page](../local-files/error-pages) to serve for this entry. Manage the available
files from "Manage Local Error Pages".

- **Values:** one of the configured local error pages
- **Default:** none
- **Required:** yes

### Overwrite Status Code {#overwriteStatusCode}

Overwrites the HTTP status code sent to the client with this one.

- **Values:** a number between `400` and `599`
- **Default:** none

## Additional Header Condition

Optionally restricts an entry to responses matching one or more response headers, using an Equals,
Contains, Starts With, Ends With or Regex match. Add up to 16 conditions per entry with the
"Add condition" button.

### Additional Header Condition {#headerConditionEnabled}

Turns the header condition on for this entry. Turning it off clears the conditions you have entered.

- **Values:** `on` or `off`
- **Default:** `off`

### Type {#type}

The source of the header to match.

- **Values:** `Response`
- **Default:** `Response`
- **Required:** yes

### Name {#name}

The name of the header to match, case-insensitive.

- **Values:** a valid HTTP header name, at most 256 characters
- **Default:** none
- **Required:** yes

### Match Type {#matchType}

How the header value is compared.

- **Values:** `Equals`, `Contains`, `Starts With`, `Ends With`, `Regex`
- **Default:** `Contains`
- **Required:** yes

### Value {#value}

The value the header is compared against. Must not contain control characters (e.g. CR or LF). When
**Match Type** is `Regex`, must be a valid regular expression.

- **Values:** free text, at most 4096 characters
- **Default:** none
- **Required:** yes
