---
title: "Translation & Redirect"
weight: 60
---

# Translation & Redirect

## Request Path Translation {#enablePathTranslation}

Enable this to configure translation of the request URI to a custom path. Turning it off clears the
pattern and substitution below. Only one of Request Path Translation and Request Redirect can be
active at a time; enabling this disables Request Redirect.

- **Values:** `on` or `off`
- **Default:** `off`

### Pattern {#pattern}

The URI is matched with a regular expression pattern.

- **Values:** free text, at most 1024 characters
- **Required:** yes

### Substitution {#substitution}

The value with which to replace the matched part of the request URI.

- **Values:** free text, at most 1024 characters
- **Required:** yes

## Request Redirect {#enableRequestRedirect}

Configure the redirect behaviour for this route. Turning it off clears the settings below. Only one
of Request Path Translation and Request Redirect can be active at a time; enabling this disables
Request Path Translation.

- **Values:** `on` or `off`
- **Default:** `off`

### Scheme {#scheme}

The scheme to redirect to. Leave unset to keep the original request's scheme.

- **Values:** `-` (keep original), `HTTP`, `HTTPS`
- **Default:** `-`
- **Required:** yes

### Hostname {#hostname}

The target hostname to which to redirect to.

- **Values:** [hostname](../../../value-types#hostname)
- **Default:** none

### Port {#port}

The target port to which to redirect to.

- **Values:** a number from `0` to `65535`
- **Default:** none

### Replace Type {#replaceType}

- **Full Path** - Replaces the entire request path with the Replacement Path.
- **Prefix** - Replaces only the matched prefix of the request path with the Replacement Path.
  Only offered when the route has exactly one path-prefix matching rule.

- **Values:** `Full Path`, `Prefix`
- **Default:** `Full Path`
- **Required:** yes

### Replacement Path {#replacementPath}

The path to which to redirect the client.

- **Values:** free text, at most 1024 characters
- **Default:** none
