---
title: "Header validation"
weight: 30
---

# Header validation

Aero WAAP checks every request header against its standard, both for its syntax and for its
maximum length. By default, a request with a header that fails either check is blocked with status
code `403`. If an application legitimately needs such a header, and it cannot be removed with
[header filtering](../header-filtering), exclude it from validation on the virtual host's
[Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab.

## Find the headers that fail validation

1. Open the virtual host, go to the [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab, and set the Header
   Validation [Mode](../../reference/gui/vhosts/rule-engine#mode) to `Detect`. Failed validations are logged, but no request is blocked.
2. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle),
   then use the application as usual.
3. Look for failed header validations in the [Live Log](../../../../platform/latest/operations/logging/live-log)
   and note which headers fail which check.

## Allow a header that fails validation

1. On the [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation) tab, click the "+" icon in the
   [Exceptions](../../reference/gui/vhosts/rule-engine#exceptions) table of the Header Validation
   section.
2. In [Exception](../../reference/gui/vhosts/rule-engine#exception), enter the name of the header. The name alone skips both checks
   for that header. To skip only one of them, add `/syntax` or `/length` to the name, for example
   `Accept-Charset/syntax`. Skip only the check that actually fails, so the other one still protects
   the header.
3. In [Comment](../../reference/gui/vhosts/rule-engine#comments-header-validation), note why the application needs the header.
4. Set the [Mode](../../reference/gui/vhosts/rule-engine#mode) back to `Block` if you changed it.
5. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle).

## Related

- [Rule Engine](../../reference/gui/vhosts/rule-engine#header-validation)
- [Header filtering](../header-filtering)
