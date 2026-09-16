---
title: "Rewrite the request path"
weight: 50
---

# Rewrite the request path

Request path translation rewrites the path of a request before it is forwarded to the backend. The
client never sees the rewritten path - it stays in the browser's address bar unchanged - which makes
this the right tool when an application's URL structure does not match what its backend actually
serves. If you instead want the client to be sent to a different URL, use
[Redirect requests](redirect).

1. Open the route and go to the [Translation & Redirect](../reference/gui/vhosts/routes/translation-and-redirect) tab.
2. Turn on "Request Path Translation".
3. Set the [Pattern](../reference/gui/vhosts/routes/translation-and-redirect#pattern): a regular expression matched against the request URI.
4. Set the [Substitution](../reference/gui/vhosts/routes/translation-and-redirect#substitution): the text that replaces the matched part.
   You can reference a group captured by the pattern with `\1`, `\2`, and so on.

> [!IMPORTANT]
> Turning on Request Path Translation turns off Request Redirect on the same route, and vice versa - a
> route can only use one at a time.

Test the pattern against real request paths. A pattern that matches more broadly than intended
rewrites paths silently; the client gets no error, but the backend receives a path it does not recognize.

[Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to
apply the change.

## Related

- [Translation & Redirect](../reference/gui/vhosts/routes/translation-and-redirect) - pattern and
  substitution field limits
- [Redirect requests](redirect) - sending the client to a different URL instead of rewriting the
  path internally
