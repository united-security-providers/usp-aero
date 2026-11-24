---
title: "Keep a client on one backend endpoint"
weight: 45
---

# Keep a client on one backend endpoint

When a backend has more than one endpoint, the Load Balancer spreads the requests of one client across
them. Some applications keep a user's session in the memory of one application server. If the next
request lands on another server, that server does not know the session. The user is logged out or
loses their work. Backend stickiness sends all requests of a client to the endpoint that served its
first request.

Aero WAAP tracks this with a cookie that it sets itself. The application does not need to change, but
the client must accept cookies. A client that drops the cookie, such as a simple API client, is
balanced as if stickiness were off.

1. Open the backend and stay on the [Settings](../reference/gui/backends/backends/#tab-settings) tab.
2. Turn on [Backend Stickiness](../reference/gui/backends/backends#stickinessEnabled).
3. Optionally enter a [Cookie Name](../reference/gui/backends/backends#cookieName). Leave it empty to
   let each route that uses the backend keep its own stickiness. Enter a name if all those routes
   must send a client to the same endpoint, for example because they are parts of one application.
4. Choose the [lifetime](../reference/gui/backends/backends#lifetimeType).
   - **Session** keeps the client on its endpoint until the browser is closed.
   - **Permanent** keeps it there across browser restarts, until the
     [Session Timeout](../reference/gui/backends/backends#absoluteTimeout) has passed. Choose a timeout
     no shorter than the application's own session.
5. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to apply the change.

If the endpoint a client is sticky to fails its health check or is removed from the backend, the next
request goes to another endpoint, and the client's session on the old one is lost.

## Related

- [Backends](../reference/gui/backends/backends): the stickiness settings and the Load Balancer
- [Health Check](../reference/gui/backends/health-check): when an endpoint counts as unhealthy
