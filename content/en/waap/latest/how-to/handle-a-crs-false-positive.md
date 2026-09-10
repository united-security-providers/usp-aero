---
title: "Handle a CRS false positive"
weight: 30
---

# Handle a CRS false positive

If a legitimate request or response is blocked by the Core Rule Set — more likely the higher the
configured [Paranoia Level](../reference/vhosts/rule-engine) is — create a rule exception on the virtual host's
[Rule Engine](../reference/vhosts/rule-engine) tab instead of lowering the paranoia level for everyone:

1. Open the virtual host and go to the Rule Engine tab.
2. Under Core Rule Set, click the "+" icon next to Rule exceptions.
3. Specify the **Rules** the exception applies to, the **Request Part** affected (such as body or
   headers), and the **Path** the exception is scoped to (optionally as a regular expression).
4. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to
   activate the exception.
