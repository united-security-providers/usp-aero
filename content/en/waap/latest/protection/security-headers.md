---
title: "Security Headers"
weight: 30
---

# Security Headers

Security headers tell the browser how to treat a site's responses: where the page may be framed,
which origins may read it, where it may load resources from, and whether the browser should even
try HTTP again. Aero WAAP sets them at two levels: [response security headers on the route](../reference/gui/vhosts/routes/headers#security-headers)
, and [Strict Transport Security (HSTS) on the virtual host](../reference/gui/vhosts/virtual-hosts#hstsEnabled).

Another security relevant header is `Server`, which often carries detailed version information
about the application server.

> [!NOTE]
> These headers are instructions to a browser. A route consumed only by non-browser clients, such as a API
> called by a server or a mobile backend, gains little from most of them because such a client simply
> ignores them. They never replace a check on the server side.

## Where to start

- **Enable on nearly every site, little risk:** X-Content-Type-Options, Referrer-Policy,
  X-Frame-Options, and HSTS once the host is confirmed to be HTTPS-only.
- **Needs knowledge of the application:** Content Security Policy, CORS. Both describe what the
  application legitimately does, so a wrong value breaks it.
- **Only for a specific need:** COOP, COEP and CORP. Enable them when the application requires
  cross-origin isolation or when a resource must not be embeddable, not as a general hardening step.

## The headers in detail

### Server

Aero WAAP always replaces the `Server` header with the default value `Aero WAAP`, so there is no information
leakage about the application server. It is possible to overwrite the default value  in the
[listener](../reference/gui/listeners/listeners#overwriteServerHeader) with a custom value to hide this as well.

### Strict-Transport-Security (HSTS)

**What it does.** After a first successful HTTPS response, the browser refuses to talk to this host
over plain HTTP for the whole Max Age period: it rewrites `http://` links to `https://` itself, and a
certificate error becomes a hard failure the user cannot click through. This closes the gap that
downgrade and TLS-stripping attacks rely on, where the very first request travels unencrypted.

**When to enable.** On every virtual host that is served exclusively over HTTPS and whose certificate
is publicly trusted and reliably renewed.

**What can break.**

- Anything on this host that must still be reachable over plain HTTP stops working for every visitor
  who has already received the header - and it cannot be withdrawn retroactively. The only way back
  is to serve `Max Age` `0` over working HTTPS and wait for each browser to come back and pick it up.
- An expired or untrusted certificate turns into an error page with no way past it. With HSTS, a
  missed renewal is an outage, not a warning.
- Include Subdomains (on by default) applies the same rule to every subdomain, including internal
  tools, test hosts and appliance UIs that may use a self-signed certificate or no TLS at all.
  Check every name under the domain before turning this on.
- Preload adds the `preload` token so the host can be submitted to the browsers' built-in preload
  list. That list is compiled into browser releases; removal takes months and is not in your hands.
  Submission is a separate step at the browser vendors.

> [!TIP]
> Roll HSTS out with a short Max Age, for example `300`, confirm that the host and all its subdomains
> work over HTTPS only, and then raise it to the default `15768000` (six months).

### X-Frame-Options

**What it does.** Tells the browser whether this response may be displayed inside a frame.
`SAMEORIGIN` allows framing only by the same origin, `DENY` forbids it entirely. It is the defense
against clickjacking, where an attacker's page loads yours invisibly and tricks the user into
clicking a button in it.

**When to enable.** On any route that serves an authenticated interface, a form, or a button that
changes state.

**What can break.** Legitimate embedding: your own application shown in an intranet portal, a CMS
preview pane, an SSO or payment dialog rendered in an iframe. `SAMEORIGIN` compares the full origin,
so a page embedded from a different hostname of your own is blocked as well.

> [!NOTE]
> The modern equivalent is the CSP directive `frame-ancestors`, which can name a list of allowed
> origins instead of just "same origin". Browsers that see both prefer `frame-ancestors`; keep
> X-Frame-Options for older clients and make sure the two agree.

### X-Content-Type-Options

**What it does.** Sends `nosniff`, which makes the browser honor the declared `Content-Type` instead
of guessing from the content. Without it, a file that the server labels harmlessly can be reinterpreted
as script - the classic path for turning a user upload into stored cross-site scripting.

**When to enable.** Essentially always.

**What can break.** A backend that labels resources wrongly or generically - JavaScript sent as
`text/plain`, a stylesheet as `application/octet-stream` - because the browser now refuses to execute
or apply them. The fix is the backend's `Content-Type`, not removing the header.

### Referrer-Policy

**What it does.** Controls how much of the current URL the browser puts in the `Referer` header when
the user navigates away or the page loads an external resource. It stops internal paths, record IDs
and tokens carried in query strings from being handed to third parties, analytics services and
anything else the page happens to load.

**When to enable.** On practically every site. The default `strict-origin-when-cross-origin` sends
the full URL to the same origin, only the origin to other HTTPS sites, and nothing when going to an
insecure one - which is what current browsers already do on their own.

**What can break.** Anything that relies on receiving a referrer: analytics and affiliate tracking,
partner integrations, and backends that use the `Referer` header for hotlink protection or as a
supplementary CSRF check. `no-referrer` removes it entirely and breaks all of these.

> [!WARNING]
> Do not use `unsafe-url`. It sends the full URL, including query parameters, to every destination and
> also across a downgrade from HTTPS to HTTP.

### Content Security Policy (CSP)

**What it does.** Declares which sources the browser may load scripts, styles, images, fonts, frames
and connections from, and whether inline script is allowed at all. It is the strongest defense-in-depth
measure against cross-site scripting: even if an injection succeeds, the injected code is not from an
allowed source and does not run. The same header also carries `frame-ancestors` (clickjacking) and
`form-action` (where forms may post to).

**When to enable.** On routes that deliver HTML for an application whose resource usage you know. The
policy is a description of that application, so it belongs with whoever changes the application.

**What can break.** A great deal, and silently - the page renders, but parts of it do nothing and the
only trace is in the browser console:

- Inline `<script>` blocks, inline event handlers such as `onclick`, `javascript:` URLs and `eval`
  are all blocked by a policy that does not explicitly allow them.
- Externally hosted libraries, tag managers, A/B testing and chat widgets fail unless their origins
  are listed - and they change origins without telling you.
- Weakening the policy with `unsafe-inline` or `unsafe-eval` restores the application, but gives up
  most of the protection. Prefer nonces or hashes, and moving inline code into files.
- A policy that is not updated when the application adds a new third-party integration breaks that
  integration at deploy time.

**Report-Only.** The Report-Only field sends the same policy as `Content-Security-Policy-Report-Only`:
the browser checks it and reports violations, but enforces nothing. Use it to roll a policy out - run
the intended policy in Report-Only first, collect what it would have blocked, correct the policy, and
only then move that value into the enforcing field. Both can be active at once, with a proven policy
enforced and a stricter one under test.

### Cross-Origin Resource Policy (CORP)

**What it does.** Says which origins may load this response as a sub-resource - an image, a script, a
font embedded by another page. `same-origin` restricts it to your own origin, `same-site` to the same
registrable domain, `cross-origin` to everyone. It keeps other sites from pulling your resources into
their pages and from using them in side-channel attacks such as Spectre-style leaks.

**When to enable.** On resources nobody else should embed: API responses, user documents, images
behind an authentication check.

**What can break.** Shared assets. If a route serves fonts, images or scripts used by another
hostname - a separate frontend, a documentation site, a CDN in front of it - `same-origin` blocks
them. Use `same-site` for another host in the same domain, `cross-origin` for genuinely public assets.

### Cross-Origin-Opener-Policy (COOP)

**What it does.** With `same-origin`, this page is put in its own browsing context group: a
cross-origin document that opens it, or that it opens, gets no reference to its window. This blocks
tabnabbing and the cross-window side channels used in XS-Leak attacks, and it is one half of what is
needed for cross-origin isolation.

**When to enable.** On authenticated application pages, and when cross-origin isolation is required.

**What can break.** Any flow that talks between windows of different origins: OAuth and SSO login
popups that report back to the opener, payment windows, social sharing dialogs.
`same-origin-allow-popups` keeps popups that this page opens able to communicate back, while still
isolating it from documents that opened it.

### Cross-Origin Embedder Policy (COEP)

**What it does.** With `require-corp`, the document refuses every cross-origin resource that has not
explicitly opted in, through a CORP header or through CORS. Together with COOP `same-origin` this
gives cross-origin isolation, which browsers require before they hand out `SharedArrayBuffer`,
high-resolution timers and some WebAssembly features.

**When to enable.** Only when the application actually needs those isolated features. It is an
enabler, not a general hardening step.

**What can break.** Essentially every third-party resource on the page - images, fonts, scripts,
iframes, analytics - unless each one sends a suitable CORP or CORS header. `credentialless` is the
gentler variant: cross-origin resources still load, but without cookies and other credentials.

### Cross-Origin Resource Sharing (CORS)

**What it does.** Unlike the headers above, CORS grants access rather than restricting it. By default
a browser lets a script read a response only from its own origin; CORS names the other origins that
may call this route and read the answer.

**When to enable.** Only when a browser application on a different origin must call this route - a
single-page application on `app.example.com` talking to an API on `api.example.com`. Leave it off if
the route is called only from its own origin or only by non-browser clients.

**What can break, and what to watch.**

- Allowing `*`, or a wildcard host, means any website a user visits can make their browser call this
  route. If the route is authenticated by cookie, that turns into read access to that user's data
  from an attacker's page.
- Allow credentials makes the browser send cookies, authorization headers and TLS client certificates
  on these requests. Combine it only with an explicit, short list of origins - never with `*`, which
  browsers reject in that combination anyway.
- Preflight cache duration is a trade-off: too short and every request pays for an extra `OPTIONS`
  round trip, too long and a change to the allowed methods or headers takes that long to reach
  browsers that already cached the old answer.
- A preflight is an `OPTIONS` request, so `OPTIONS` must be among the route's
  [allowed methods](limit-http-methods).
- CORS is not a protection for the route. A non-browser client ignores it completely, so the route
  still needs its own authentication and authorization.

## Related

- [Headers](../reference/gui/vhosts/routes/headers)
- [Virtual Hosts](../reference/gui/vhosts/virtual-hosts)
- [Listeners](../reference/gui/listeners/listeners)
- [Header filtering](header-filtering)
- [Restrict HTTP Methods](limit-http-methods)
