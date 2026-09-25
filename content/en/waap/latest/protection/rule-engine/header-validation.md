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
2. In the Header Validation section, click the "+" icon and enter the header to except
   (header names are case-insensitive), optionally with a comment saying why it is needed.

A refined approach is to set the mode first to detect and grep corresponding log entries.
Note that for each header there are two validations, one for the syntax and one for the
maximal length.
It is possible to exclude just one of the two checks from validation,
for example with `Accept-Charset/syntax` or `Accept-Charset/length`.

## Related

- [Header filtering](../header-filtering)
