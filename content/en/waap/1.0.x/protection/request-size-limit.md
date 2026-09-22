---
title: "Limit request size"
weight: 30
---

# Limit request size

For the WAF to effectively inspect substantial data volumes, including extensive request bodies
and large file uploads, precise configuration is paramount. Misconfigured limits can result in
the erroneous blocking of legitimate requests, whereas excessively high thresholds can cause
significant memory overhead, elevated CPU utilization, and a heightened risk of performance
bottlenecks or denial-of-service (DoS) vulnerabilities.

> [!NOTE]
> By default every route has a request limit size set to 10kb.

## Limit the payload the route accepts for inspection

1. Open the virtual host, select the route, and go to its [HTTP](../reference/gui/vhosts/routes/http)
   tab, under Request Body Inspection.
2. Set **Maximum payload size** to the largest request body this route should accept for inspection.
3. Leave **Disable rule engine for body payload** off unless the route genuinely needs to accept bodies
   the Rule Engine cannot handle. See the warning below.
4. [Create a revision and deploy it](../../../platform/1.0.x/concepts/configuration-lifecycle).

> [!WARNING]
> Disable rule engine for body payload switches off every Rule Engine rule that inspects or parses
> the body for that route. Use it only for a route that genuinely needs to accept bodies the rule
> engine cannot handle, such as large file uploads.

> [!TIP]
> Often only one or two endpoint require a higher payload size. It is advised to create for these paths
> a separate route so the limit can be adjusted precisely and to address the warning above in the best
> way.

## Related

- [HTTP](../reference/gui/vhosts/routes/http)
- [Rule Engine](../reference/gui/vhosts/rule-engine)
- [OWASP Top10](rule-engine/owasp-top-10)
- [(D)DoS protection](ddos-protection)
