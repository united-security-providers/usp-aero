---
title: "Translation & Redirect"
weight: 60
---

# Translation & Redirect

## Switch "Request Path Translation"

Enable this to configure translation of the request URI to a custom path.

### Pattern

The URI is matched with a regular expression pattern.

### Substitution

The value with which to replace the matched part of the request URI.

## Switch "Request Redirect"

Configure the redirect behaviour for this route.

### Scheme

The scheme (HTTP or HTTPS) to redirect to. Leave unset to keep the original request's scheme.

### Hostname

The target hostname to which to redirect to.

### Port

The target port to which to redirect to.

### Replace Type

- **Full Path** - Replaces the entire request path with the Replacement Path.
- **Prefix** - Replaces only the matched prefix of the request path with the Replacement Path.

### Replacement Path

The path to which to redirect the client.
