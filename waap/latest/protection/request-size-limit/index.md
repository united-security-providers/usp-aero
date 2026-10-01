> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Limit request size

Every route limits the size of the request bodies it accepts. A request whose body is larger than
the route's **Maximum payload size** is rejected with status code `413` and never reaches the
backend. A limit that is too low blocks legitimate requests such as file uploads, and one that is
too high lets every request tie up memory and CPU on the appliance.

> [!NOTE]
> By default every route has a request limit size set to 10kb.

## The limit and the Rule Engine

**Maximum payload size** is shown under Request Body Inspection, but it does not depend on the
[Rule Engine](../reference/gui/vhosts/rule-engine). The limit is enforced on its own, whether or not
the Rule Engine inspects the body. What **Disable rule engine for body payload** changes is how the
body is handled on its way to the backend.

- **With the Rule Engine inspecting the body**, which is the default, Aero WAAP receives the complete
  body and keeps it in memory, lets the Rule Engine inspect it, and only then forwards it to the
  backend. Every request can therefore occupy memory up to the Maximum payload size, which is
  limited to 1 GB in this case.
- **With Disable rule engine for body payload switched on**, the body is not kept for inspection. It
  is passed on to the backend as it arrives, so a large body does not have to fit in memory. The
  Maximum payload size is still enforced and can be set above 1 GB.

## Limit the payload the route accepts

1. Open the virtual host, select the route, and go to its [HTTP](../reference/gui/vhosts/routes/http)
   tab, under Request Body Inspection.
2. Set **Maximum payload size** to the largest request body this route should accept.
3. Leave **Disable rule engine for body payload** off unless the route genuinely needs to accept bodies
   that are too large to be held in memory for inspection. See the warning below.
4. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle).

> [!WARNING]
> Disable rule engine for body payload switches off every Rule Engine rule that inspects or parses
> the body for that route. An attack carried in the body, such as SQL injection in a form field,
> then reaches the backend unchecked. Use it only for a route that genuinely needs it, such as one
> for large file uploads.

> [!TIP]
> Often only one or two endpoints need a larger payload size. Create a separate route for these
> paths, so that the limit can be raised, and the Rule Engine switched off for the body, only where
> it is needed.

## Related

- [HTTP](../reference/gui/vhosts/routes/http)
- [Rule Engine](../reference/gui/vhosts/rule-engine)
- [OWASP Top10](rule-engine/owasp-top-10)
- [(D)DoS protection](ddos-protection)
