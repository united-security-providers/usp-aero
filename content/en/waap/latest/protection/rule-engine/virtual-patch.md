---
title: "Virtual patching"
weight: 20
---

# Virtual patching

A virtual patch is a custom rule you add to the rule engine to block a specific attack immediately,
without changing the application itself. It buys time between finding a vulnerability - or an attack
already under way - and actually fixing the code, or waiting for a Core Rule Set update to cover it.

## Add a custom rule

1. Open the virtual host's [Rule Engine](../../reference/gui/vhosts/rule-engine) tab, under Custom
   rules, and click the "+" icon.
2. Give the rule a Name, and write the Rule as a [SecLang expression](https://www.coraza.io/docs/seclang/) - the
   same rule language [Coraza](https://www.coraza.io/) uses to evaluate the Core Rule Set itself - matching
   the specific attack you want to block.
3. Turn on "Before CRS" if this rule must run ahead of the Core Rule Set, for example to set variables
   or add special exceptions.
4. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle) -
   the patch has no effect before that.


> [!IMPORTANT]
> A custom rule is evaluated independently of the Core Rule Set's Mode: it still blocks matching
>  traffic even while the Core Rule Set itself is set to `Disabled` or `Detect`.

> [!TIP]
> Write the rule's action as logging rather than blocking while you test it, the same way the Core
>  Rule Set's own `Detect` mode works, and switch it to actually block once you have confirmed it
>  does not match legitimate traffic.

## Related

- [Rule Engine](../../reference/gui/vhosts/rule-engine)
- [OWASP Top10](owasp-top-10)
- [Handle a CRS false positive](handle-a-crs-false-positive)
- [Coraza](https://www.coraza.io/): rule engine
