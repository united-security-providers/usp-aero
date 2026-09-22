---
title: "Routes"
weight: 10
---

# Routes

A route matches part of the virtual host's incoming traffic - by URI path and, optionally, request
headers - and sends it to a backend.

## Routes list

The table lists the routes configured on this virtual host.

### Name {#name-column}

The route's name.

### Backend {#backend-column}

The backend the route forwards matching requests to.

### Add Route {#add-route}

Creates a new route and opens its Settings tab.

- **Values:** button

### Edit {#edit-route}

Opens the route for editing (or viewing, in read-only mode). Clicking anywhere in the row does the
same.

- **Values:** button

### Delete {#delete-route}

Deletes the route, after confirmation.

- **Values:** button

## Tab "Settings"

### Name {#name}

Configure a name for the route. This is a label used to reference this route in other configuration
screens.

- **Values:** free text. Use only letters, digits, hyphens, dots (`.`) and spaces; must start and
  end with a letter or digit, at most 253 characters. Must be unique among the virtual host's routes.
- **Default:** none
- **Required:** yes

## Route Matching Rules

Configure the rules that define when this route is used for an incoming request. Add a rule with the
**+** button; at least one is required, up to 16 per route and up to 128 across all routes of the
virtual host.

Each rule always starts with one Path matcher, which cannot be removed. Header matchers can be added
to a rule with the "Add Header matcher" button, up to 16 per rule; header names must be unique within
a rule.

### Type {#type}

Whether the matcher applies to the request's URI path or to a request header. A rule's first matcher
is always Path; matchers added afterwards are always Header.

- **Values:** `Path`, `Header`

### Matcher {#matcher}

How the value below is compared against the request. A Path matcher offers `Path Prefix`, `Exact` or
`Regex`; a Header matcher offers `Exact` or `Regex`.

- `Path Prefix` - the matcher value either equals or is a part at the beginning of the request URI.
- `Exact` - the URI path, or the header value, must equal the matcher value exactly.
- `Regex` - the URI path, or the header value, is matched with a regular expression.

- **Values:** `Path Prefix`, `Exact`, `Regex` for a Path matcher; `Exact`, `Regex` for a Header
  matcher
- **Default:** `Path Prefix` for a rule's Path matcher, `Exact` for a newly added Header matcher
- **Required:** yes

### Header Name {#headerName}

The name of the request header to match. Only shown for a Header matcher.

- **Values:** an HTTP header name, at most 256 characters
- **Default:** none
- **Required:** yes, for a Header matcher

### Value {#value}

The value to match the request URI, or the header, against.

- **Values:** free text, at most 1024 characters for a Path matcher or 4096 characters for a Header
  matcher. For a Path matcher whose Matcher is not `Regex`, the value must start with `/`, must not
  contain `//`, `/./`, `/../` or `%2f`, must not contain `#`, and must not end with `/.` or `/..`.
- **Default:** `/` for a rule's initial Path matcher
- **Required:** yes

## Backend

### Backend {#backendId}

Select the target [backend](../../backends/backends) for this route. Not available, and cleared,
while a Request Redirect is configured on the route's
[Translation & Redirect tab](translation-and-redirect#enableRequestRedirect), since a route cannot
both redirect and forward to a backend.

- **Values:** one of the configured backends
- **Default:** none

