---
title: "Headers"
weight: 30
---

# Headers

Configure request and response header filtering and manipulation here.

## Filtering {#enabled}

Filters request or response headers based on various criteria. Configured separately for the
"Request" and "Response" tabs, except **Log Only**, which applies to both.

- **Values:** `on` or `off`
- **Default:** `on`

### Filter Class {#allowClass}

Restricts which headers may pass through, on top of the allow/deny lists below. Only available for
the "Request" tab.

- **Values:** `Restricted`, `Standard`, `Extended`
- **Default:** `Standard`
- **Required:** yes

### Explicitly Allowed Headers {#allowedHeaders}

Headers to always be allowed and passed through, regardless of the filter class.

- **Values:** a list of HTTP header names - letters, digits and the characters
  `!#$%&'*+.^_`|~-`, at most 256 characters each
- **Default:** none

### Explicitly Denied Headers {#deniedHeaders}

Headers to always be blocked and removed, regardless of the filter class.

- **Values:** a list of HTTP header names - letters, digits and the characters
  `!#$%&'*+.^_`|~-`, at most 256 characters each
- **Default:** none

### Deny Headers by value {#denyPatterns}

Blocks a header based on its value rather than its name. Add a row with the **+** button.

- **Header Name** - the header the pattern is matched against.
  - **Values:** an HTTP header name - letters, digits and the characters `!#$%&'*+.^_`|~-`,
    at most 256 characters
  - **Required:** yes
- **Value Pattern**
  - **Values:** free text
  - **Required:** yes

### Log Only {#logOnly}

If enabled, denied headers are not actually blocked; the match is only logged.

- **Values:** `on` or `off`
- **Default:** `off`

## Manipulation

Changes the value of request or response headers on the fly. Configured separately for the
"Request" and "Response" tabs. Add a row with the **+** button; at most 64 manipulations are
allowed per direction, and at most 16 per action.

### Action {#action}

- **Add** - Adds a new header with the given name and value. If a header of the same name already
  exists, an additional value for this header will be added (headers can be set multiple times with
  different values).
- **Set** - Sets the header with the given name and value.
- **Remove** - Removes the header with the given name.
- **Add if absent** - Adds a header with the given name and value if no header with that name exists
  yet.
- **Overwrite if exists** - Overwrites an existing header with the given name if there is one.

- **Values:** `Add`, `Set`, `Remove`, `Add if absent`, `Overwrite if exists`
- **Required:** yes

### Header Name {#headerName}

The name of the header to which the action refers.

- **Values:** an HTTP header name - letters, digits and the characters `!#$%&'*+.^_`|~-`,
  at most 256 characters
- **Required:** yes

### Value {#value}

The value to be used in the action. Not shown, and not sent, when the action is `Remove`.

- **Values:** free text, at most 4096 characters
- **Required:** yes, unless the action is `Remove`

## Security Headers

Enables and configures well-known security-related response headers.

### X-Frame-Options {#frameOptions}

Tells the browser whether the response may be displayed in a frame.

- **Values:** `DENY`, `SAMEORIGIN`
- **Default:** `SAMEORIGIN` (set when the header is turned on)

### X-Content-Type-Options {#contentTypeOptions}

Sends `X-Content-Type-Options: nosniff`, telling the browser not to guess a response's content
type.

- **Values:** `on` or `off`
- **Default:** `off`

### Referrer-Policy {#referrerPolicy}

Controls how much referrer information the browser includes when it navigates away from this
response.

- **Values:** `no-referrer`, `no-referrer-when-downgrade`, `origin`, `origin-when-cross-origin`,
  `same-origin`, `strict-origin`, `strict-origin-when-cross-origin`, `unsafe-url`
- **Default:** `strict-origin-when-cross-origin` (set when the header is turned on)
- **Required:** yes

### Content Security Policy (CSP) {#contentSecurityPolicy}

Restricts the sources the browser may load scripts, styles and other resources from.
The `Content-Security-Policy` header value.

- **Values:** free text, at most 8192 characters
- **Default:** none
- **Required:** yes (when the header is turned on)

### Content Security Policy (Report-Only) {#contentSecurityPolicyReportOnly}

Sends the policy as `Content-Security-Policy-Report-Only`, so violations are reported without
being enforced.
The `Content-Security-Policy-Report-Only` header value.

- **Values:** free text, at most 8192 characters
- **Default:** none
- **Required:** yes (when the header is turned on)

### Cross-Origin Resource Policy (CORP) {#crossOriginResourcePolicy}

Restricts which origins may load this response as a sub-resource.

- **Values:** `same-origin`, `same-site`, `cross-origin`
- **Default:** `same-origin` (set when the header is turned on)

### Cross-Origin Embedder Policy (COEP) {#crossOriginEmbedderPolicy}

Requires resources this page embeds to explicitly opt in, enabling cross-origin isolation.

- **Values:** `require-corp`, `credentialless`, `unsafe-none`
- **Default:** `unsafe-none` (set when the header is turned on)

### Cross-Origin-Opener-Policy (COOP) {#crossOriginOpenerPolicy}

Isolates this page's browsing context group from cross-origin documents.

- **Values:** `same-origin`, `same-origin-allow-popups`, `unsafe-none`
- **Default:** `same-origin` (set when the header is turned on)

### Cross-Origin Resource Sharing (CORS) {#crossOriginResourceSharing}

Allows scripts on other origins to make requests to this route and read the response.

#### Allowed Origin {#allowOrigins}

The origins allowed to make cross-origin requests. Add one with the **+** button; at least one is
required while CORS is enabled, and at most 256 are allowed.

- **Values:** an origin such as `https://example.com`, `*`, or a scheme with a wildcard host; at
  most 253 characters; must be unique in the list
- **Default:** none
- **Required:** yes

#### Allowed Methods {#allowMethods}

The HTTP methods allowed for cross-origin requests. Press Enter to add a value.

- **Values:** a list of HTTP methods (`GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE`, `CONNECT`,
  `OPTIONS`, `TRACE`), at most 16 entries
- **Default:** none

#### Allowed Headers {#allowHeaders}

The request headers the browser is allowed to send. Press Enter to add a value.

- **Values:** a list of HTTP header names - letters, digits and the characters
  `!#$%&'*+.^_`|~-`, at most 256 characters each, up to 256 entries
- **Default:** none

#### Expose Headers {#exposeHeaders}

The response headers made readable to browser scripts. Press Enter to add a value.

- **Values:** a list of HTTP header names - letters, digits and the characters
  `!#$%&'*+.^_`|~-`, at most 256 characters each, up to 256 entries
- **Default:** none

#### Allow credentials {#allowCredentials}

Whether cookies, authorization headers or TLS client certificates are allowed on cross-origin
requests.

- **Values:** `on` or `off`
- **Default:** `off`

#### Preflight cache duration (seconds) {#maxAgeSeconds}

How long the browser may cache the result of a preflight request.

- **Values:** a non-negative number of seconds
- **Default:** none
- **Required:** yes, while CORS is enabled

