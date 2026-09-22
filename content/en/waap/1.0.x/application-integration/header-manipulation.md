---
title: "Header manipulation"
weight: 30
---

# Header manipulation

A route can add, change or remove HTTP headers on the way to the backend, and on the way back to
the client. Use this to inject a header a backend expects but the client never sends, to strip a
header before it reaches the backend, or to correct a response header the application gets wrong.

1. Open the route and go to the [Headers](../reference/gui/vhosts/routes/headers) tab.
2. Choose the "Request" or "Response" tab, depending on whether you want to change headers going to
   the backend or back to the client.
3. Under "Manipulation", add an entry and choose an
   [Action](../reference/gui/vhosts/routes/headers#action): **Add**, **Set**, **Remove**, **Add if absent** or
   **Overwrite if exists**.
4. Enter the Header Name, and the Header Value if the action needs one.

    **Set** replaces every existing value of that header, while **Add** appends another value alongside any
    that are already there. Choosing **Set** on a header the application relies on (e.g. `Host` or
    `Content-Type`) silently changes what the backend sees, so double check the header name before saving.

5. [Create a revision and deploy it](../../../platform/1.0.x/concepts/configuration-lifecycle) to apply the change.

## Related

- [Headers](../reference/gui/vhosts/routes/headers): the full set of manipulation actions, plus header
  filtering and security headers on the same tab
- [Cookie manipulation](cookie-manipulation): the same idea, applied to cookies
