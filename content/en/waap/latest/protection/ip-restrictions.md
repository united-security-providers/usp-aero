---
title: "IP restriction"
weight: 30
---

# IP restriction

IP restriction limits which client addresses may reach a route, regardless of what else the request
matches. Use it to expose a sensitive route - such as an admin path - only to a known set of
addresses, or to block a known-bad set of addresses while leaving the route open to everyone else.

## Configure a rule

1. Open the virtual host, select the route, and go to its
   [Access Control](../reference/gui/vhosts/routes/access-control) tab.
2. Turn on IP Access Control.
3. Choose the Access Mode: Allow only listed IPs blocks everything except the rules you add; Block
   listed IPs allows everything except the rules you add.
4. Add a rule for each address or range: pick Type `ip` for a single address or `cidr` for a range,
   enter the Value, and give it a Label.
5. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle).

> [!CAUTION]
> Allow only listed IPs with an empty rules table blocks all traffic to the route - add at least one
> rule before saving, or the route becomes unreachable.

> [!NOTE]
> Turning IP Access Control off clears both the Access Mode and the rules table. Turning it back on
> later starts from scratch, not from what was configured before.

## Related

- [Access Control](../reference/gui/vhosts/routes/access-control)
