---
title: "Header filtering"
weight: 30
---

# Header filtering

Header filtering removes or blocks HTTP headers before they reach the backend or the client. Use it
to strip headers an attacker adds while probing the application, to stop an internal header leaking
upstream through a badly configured proxy, or to drop a header whose value looks malicious. It runs
on the route, configured separately for the request and the response.

> [!TIP]
> Test with "Log Only" first. A header the application actually needs, such as `Authorization` or a
> custom API key header, is blocked outright can break the application instantly with only the log to
> explain why.

## Configure filtering

1. Open the virtual host, select the route, and go to its
   [Headers](../reference/gui/vhosts/routes/headers) tab, under Filtering. The Request and Response tabs
   are configured independently.
2. On the Request tab, choose a [Filter Class (Restricted, Standard or Extended)](../reference/header-filtering-classes).
   Filter Class only applies to the request, the Response tab has no Filter Class, and an implicit class is applied.
3. Add headers to **Explicitly Allowed Headers** or **Explicitly Denied Headers** to override the class for
   specific headers, and add entries under **Deny Headers by value** to block a header based on a
   pattern in its value, regardless of its name.
4. Repeat on the Response tab.
5. [Create a revision and deploy it](../../../platform/1.0.x/concepts/configuration-lifecycle).


> [!NOTE]
> **Explicitly Allowed Headers** and **Explicitly Denied Headers** must not list the same header.
> The route will report it as a duplicate.

## Related

- [Header Filter Classes](../reference/header-filtering-classes)
- [Headers](../reference/gui/vhosts/routes/headers)
- [Security Headers](security-headers)
- [IP restriction](ip-restrictions)
- [Restrict HTTP Methods](limit-http-methods)
