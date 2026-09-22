---
title: "Handle a CRS false positive"
weight: 30
---

# Handle a CRS false positive

If a legitimate request or response is blocked by the Core Rule Set — more likely the higher the
configured [Paranoia Level](../../reference/gui/vhosts/rule-engine) is — create a rule exception on the virtual host's
[Rule Engine](../../reference/gui/vhosts/rule-engine) tab. The goal is to open the smallest gap in the defense to allow legit traffic:

1. Open the virtual host and go to the Rule Engine tab.
2. Under Core Rule Set, click the "+" icon next to Rule exceptions.
3. Specify the **Rules** the exception applies to, the **Request Part** affected (such as body or
   headers), and the **Path** the exception is scoped to (optionally as a regular expression).
4. [Create a revision and deploy it](../../../../platform/1.0.x/concepts/configuration-lifecycle) to
   activate the exception.
