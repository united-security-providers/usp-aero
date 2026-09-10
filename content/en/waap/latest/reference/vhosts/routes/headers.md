---
title: "Headers"
weight: 30
---

# Headers

Configure request and response header filtering and manipulation here.

## Filtering

If enabled, allows to filter request or response headers based on various criteria. Configured
separately for the "Request" and "Response" tabs.

### Filter Class

- **Restricted**
- **Standard**
- **Extended**

### Explicitly Allowed Headers

Whitelist of headers to always be allowed and passed through.

### Explicitly Denied Headers

Blacklist of headers to always be blocked and removed.

### Deny Headers by value

Blocks headers based on their value.

### Log Only

If enabled, denied headers will not actually be blocked; the match will just be logged.

## Manipulation

Allows to change the value of request or response headers on the fly. Configured separately for the
"Request" and "Response" tabs.

### Action

- **Add** - Adds a new header with the given name and value. If a header of the same name already
  exists, an additional value for this header will be added (headers can be set multiple times with
  different values).
- **Set** - Sets the header with the given name and value.
- **Remove** - Removes the header with the given name.
- **Add if absent** - Adds a header with the given name and value if no header with that name exists
  yet.
- **Overwrite if exists** - Overwrites an existing header with the given name if there is one.

### Header Name

The name of the header to which the action refers.

### Header Value

The value to be used in the action.

## Security Headers

Enable and configure well-known security-related response headers:

- **Content Security Policy (CSP)**, and its Report-Only variant.
- **X-Content-Type-Options**
- **Cross-Origin Embedder Policy (COEP)** - `require-corp`, `credentialless` or `unsafe-none`.
- **Cross-Origin-Opener-Policy (COOP)** - `same-origin`, `same-origin-allow-popups` or `unsafe-none`.
- **Cross-Origin Resource Policy (CORP)** - `same-origin`, `same-site` or `cross-origin`.
- **Cross-Origin Resource Sharing (CORS)** - Allowed Origins, Allowed Methods, Allowed Headers,
  Expose Headers, Allow credentials, and the preflight cache duration.
- **X-Frame-Options** - `DENY` or `SAMEORIGIN`.
- **Referrer-Policy** - one of the standard referrer policy values (e.g. `no-referrer`,
  `same-origin`, `strict-origin-when-cross-origin`, ...).
