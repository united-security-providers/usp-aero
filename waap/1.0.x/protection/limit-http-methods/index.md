> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Restrict HTTP Methods

Restricting HTTP methods stops a request using a verb the backend does not expect from ever reaching
it. For example blocking `TRACE` or `PUT` on a route that should only ever serve `GET` and `POST`.
It narrows the attack surface a route exposes without changing the application itself.

A request using a method that is not on the right is rejected with `405 Method Not Allowed`,
without reaching the backend.

## Configure allowed methods

1. Open the virtual host, select the route, and go to its [HTTP](../reference/gui/vhosts/routes/http)
   tab, under Allowed Methods.
2. Move the methods this route should accept to the list on the right, and leave the rest on the
   left. At least one method must stay selected.
3. Save.
4. [Create a revision and deploy it](../../../platform/1.0.x/concepts/configuration-lifecycle).

> [!NOTE]
> `GET`, `HEAD`, `OPTIONS` and `POST` are allowed by default, any other method the application
> actually needs (e.g. `PATCH` for a REST API, or `OPTIONS` handling for a CORS preflight)
> must be added explicitly, or it is rejected outright.

## Related

- [Route HTTP settings ](../reference/gui/vhosts/routes/http)
