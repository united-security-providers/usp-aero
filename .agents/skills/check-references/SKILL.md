---
name: check-references
description: Check that every reference in one documentation version resolves, across all components. Covers internal links, heading anchors and images, including links into draft pages, external http(s) URLs, and the rule that a release must never link to latest. Use when asked to verify links/references/anchors for a version such as "latest", "0.5.x" or "1.0.x", when checking all components at once, or before freezing a release with `make prepare-release`.
---

# Check the references of a documentation version

A version is a directory: `content/en/<component>/<version>/`, with `platform` and
`waap` as the components. `make check-links` takes one version and checks every
reference on every page of that version, in all components that have it.

## Running it

```bash
make check-links VERSION=latest     # or 0.5.x, 1.0.x
make check-links VERSION=all        # every version of every component
```

It exits non-zero when something is broken, so it also works as a release gate.
`VERSION` defaults to `all`.

Every `http(s)` link is requested too, on every run, and a dead one fails the
check like any other. That is deliberate: a site that has quietly gone away is the
dead link nobody notices for years, and a flaky host costing a rerun is the better
trade. It adds a second or two.

`OFFLINE=1` skips the network when there is none. It prints a warning that it did,
because a run that checked no external link must not be mistaken for a clean one -
re-run without it before trusting the result.

The target depends on `build`, so the site is always rebuilt first. Do not try to
check a site built earlier: after fixing a link you would be handed the *old*
answer, with nothing to indicate it was stale.

The build is also what makes the check possible. Hugo's `render-link` hook
resolves a Markdown link through `GetPage`, and when that finds nothing it falls
back to writing the raw path into the href - so a link to a moved page, a
misspelled path and a link into a `draft: true` page all look the same in the
source and only differ in the output.

## Reading the findings

Two checks run, and both always run, so one round reports everything.

### Links that do not resolve

lychee reports the *built* file, and the line within it:

```
[ERROR] file://.../public/waap/latest/reference/gui/vhosts/error-pages (at 391:21)
        | File not found.
```

To get back to what you edit, drop `public/` for `content/en/` and take the page
path: `public/waap/latest/concepts/request-flow/index.html` came from
`content/en/waap/latest/concepts/request-flow.md`, or from
`.../request-flow/_index.md` when the page is a section. The line number is the
one in the generated HTML, not in the Markdown, so find the link in the source by
searching for its destination.

What the messages mean:

- **File not found** on a path with no extension - most often a link into a page
  with `draft: true`, which is left out of the build entirely. Either publish the
  target or make the link plain text; the README lists the drafts that are waiting
  on a release.
- **File not found** on an image or asset - it is missing from `assets/`.
- **Cannot find fragment** - the target heading lost its explicit `{#id}` anchor,
  or the id was renamed. Reference-page ids are linked from the product GUI and
  must not change, so fix the heading rather than the link.
- **Rejected status code** or **Connection failed** on an `http(s)` link - the
  page or the whole site is gone. Check it by hand before deleting the link: a
  host can be down for an hour. Reserved documentation domains (`.invalid`,
  `.example`, `.test`) are skipped by design and never reported.

A link written against the site's own absolute URL is caught too: it is remapped
onto the local build, so it fails here rather than silently 404ing in production.

### A release linking into `latest`

```
public/waap/0.5.x/index.html:142: links to /usp-aero/platform/latest/install/installation/
A release must not link to latest; it is still changing.
```

The link resolves - that is why the link checker says nothing about it - but a
frozen release must not point at documentation still under development, in its own
component or any other. Link to the matching release of that component instead, or
restate on the page whatever the reader needed.

`latest` itself is exempt, and only the prose is examined, so the version selector
and the navigation do not trip it. The rule lives in `scripts/frozen-links.awk`.

## What it does not cover

Whether an anchor is spelled the way the product expects, and whether a reference
page still lives at the URL an appliance in the field links to. Both are contracts
with `aero-mgmt-app`, not something the site can tell you.
