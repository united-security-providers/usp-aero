---
title: "Header validation"
weight: 30
---

# Header validation

If a client sends request headers that do not abide by their respective standards,
they are blocked by default.
If such a header is needed for proper functionality (and hence cannot be filtered out),
header validation can be turned off per header as follows:

1. Open the virtual host and go to the Rule Engine tab.
2. Enter the names of headers to ignore during validation (case-insensitive).

A refined approach is to set the feature first to detect and grep corresponding log entries.
Note that for each header there are two validations, one with a  regular expression
and one for the maximal length.
It is possible to exclude just one of the two checks from validation,
for example with `Accept-Charset/regex` or `Accept-Charset/length`.

## Related

- [Header filtering](../header-filtering)
