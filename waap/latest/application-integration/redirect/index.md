> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Redirect requests

A redirect sends the client to a different URL instead of forwarding the request to a backend. Use
it to move traffic to a new hostname or path, or to force plain HTTP requests onto HTTPS. If you want
the backend to receive a different path while the client keeps seeing the original URL, use
[Rewrite the request path](translation) instead.

## Redirect on a route

1. Open the route and go to the [Translation & Redirect](../reference/gui/vhosts/routes/translation-and-redirect) tab.
2. Turn on "Request Redirect".
3. Set [Scheme](../reference/gui/vhosts/routes/translation-and-redirect#scheme),
   [Hostname](../reference/gui/vhosts/routes/translation-and-redirect#hostname) and
   [Port](../reference/gui/vhosts/routes/translation-and-redirect#port) as needed. Leave Scheme as "-",
   and Hostname and Port blank, to keep the corresponding value from the original request.
4. Choose the [Replace Type](../reference/gui/vhosts/routes/translation-and-redirect#replaceType). "Full
   Path" replaces the whole request path with the Replacement Path. "Prefix" is only offered when the
   route has exactly one matching rule with a path-prefix matcher.
5. Set the [Replacement Path](../reference/gui/vhosts/routes/translation-and-redirect#replacementPath).

    > [!IMPORTANT]
    > Turning on Request Redirect turns off Request Path Translation on the same route, and vice versa. A
    > route can only use one at a time.

    Leaving Scheme, Hostname and Port at their original-request value on every field means the redirect
    target can end up identical to the request that triggered it, which sends the client into a redirect loop.

6. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to
apply the change.

## HTTP to HTTPS redirect for an entire virtual host

By default, a new virtual host redirects all plain HTTP requests to HTTPS.
This redirects the whole virtual host, it does not need a route-level Request Redirect.
If both HTTP and HTTP traffic should be allowed, disable the virtual host's redirect setting:

1. Open the [virtual host](../reference/gui/vhosts/virtual-hosts)'s Settings tab.
2. Disable "Generate HTTP to HTTPS redirect".
3. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to
apply the change.

## Related

- [Translation & Redirect](../reference/gui/vhosts/routes/translation-and-redirect): all redirect fields
- [Virtual Hosts](../reference/gui/vhosts/virtual-hosts): the HTTP to HTTPS redirect setting
- [Rewrite the request path](translation): changing the path the backend sees without redirecting
  the client
