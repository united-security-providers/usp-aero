---
title: "Routes"
weight: 10
---

# Routes

## Tab "Settings"

### Name

Configure a name for the route. This is a label used to reference this route in other configuration
screens.

## Route Matching Rules

Configure the rules that define when this route will be used for an incoming request.

- At least one path matcher MUST be configured. This matches the incoming request to this route
  based on the request URI matching the given path matcher value.
- Additionally, optional header matchers can be defined. These allow to match a request to this
  route based on request header values.

### Path

- Matcher
  - **Path Prefix** - The matcher value either equals or is a part at the beginning of the request
    URI.
  - **Exact** - The URI path must equal the matcher value exactly.
  - **Regex** - Match the URI to the route value with a regular expression.
- **Value** - The value with which to match the request URI based on the selected matcher.

### Header

- Matcher
  - **Exact** - The request header must equal the configured value exactly.
  - **Regex** - Matches the request header value with the configured value using a regular
    expression.
- **Header Name** - The name of the request header.
- **Value** - The value of the request header.

## Backend

Select the target [backend](../../backends/backends) for this route.
