---
title: "Cookie manipulation"
weight: 40
---

# Cookie manipulation

A route can add, overwrite or remove cookies on the way to the backend, and on the way back to the
client. Use this to inject a cookie the backend expects, to strip a cookie before it reaches the
backend, or to add or change attributes such as `Secure` or `SameSite` on a cookie the application
sets.

1. Open the route and go to the [Cookies](../reference/gui/vhosts/routes/cookies) tab.
2. Choose the "Request" or "Response" tab, depending on whether you want to change the `Cookie`
   header sent to the backend or the `Set-Cookie` header sent back to the client.
3. Under "Cookie Manipulation", add an entry, enter the Cookie Name and, unless you are removing the
   cookie, its Value.
4. Choose an [Action](../reference/gui/vhosts/routes/cookies#action). **Remove**, **Add if absent**, **Overwrite
   if exists** and **Overwrite if exists or add** work on both tabs. **Modify attributes if cookie present**
   is only available on the Response tab, because a request cookie carries no attributes.
5. For **Modify attributes if cookie present**, add at least one attribute with its own name and
   value. This changes the cookie's attributes without touching its value.
6. [Create a revision and deploy it](../../../platform/1.0.x/concepts/configuration-lifecycle) to apply the change.

## Related

- [Cookies](../reference/gui/vhosts/routes/cookies): actions, and the character and length limits for
  names and values
- [Header manipulation](header-manipulation): the same idea, applied to headers
