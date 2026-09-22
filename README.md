# USP Aero documentation

This repository contains the USP Aero documentation, published under https://docs.united-security-providers.ch/usp-aero/.
The content is in `content/en/<product>/<version>/`.

## Building

There are no required dependencies.
Hugo, Pagefind and lychee will always be downloaded with the make target `download-tools` on first use.

```bash
make serve           # build, then http://localhost:1313/usp-aero/ with live reload
make build           # build into public/, search index included
make check-links     # build, then check every link, anchor and image
make clean           # remove the build output; bin/ stays
make download-tools  # fetch the toolchain without building
make clean-tools     # remove the toolchain from bin/
```

## Checking the links

`make check-links` builds the site and runs [lychee](https://lychee.cli.rs/) over
the result, which is the only way to see what a link really resolved to: a link
to a moved page, a misspelled path and a link into a `draft: true` page all look
the same in the Markdown and differ only in the output.

```bash
make check-links VERSION=1.0.x   # one version, in every component
make check-links                 # the whole site; VERSION defaults to all
```

It checks internal links, heading anchors and images, reports everything it finds
and exits non-zero if there was anything, so it works as a release gate.

Every `http(s)` link is requested too, on every run - a site that has quietly gone
away is exactly the dead link nobody notices for years, and a flaky host costing a
rerun is the better trade. It adds a second or two. `OFFLINE=1` skips them when
there is no network and says loudly that it did, so a run that checked nothing
cannot be mistaken for a clean one.

Releases are checked for one thing more: no page of a release may link into any
component's `latest`. Such a link resolves, so the link checker is right not to
mind it, but it aims a frozen release at documentation that keeps changing. Link
to the matching release instead, or restate what the page needs. `latest` itself
is exempt, and only the prose counts - the version selector and the navigation
cross versions by design.

Findings name the built file under `public/`. The Markdown behind it is the same
path under `content/en/`, with `/index.html` becoming `.md` - or `_index.md` where
the page is a section.

## Updating the theme

The theme is a Hugo module. One command moves it to the newest release and
writes `go.mod` and `go.sum`:

```bash
make update-theme                        # newest release
make update-theme THEME_VERSION=v0.3.0   # a specific one
```

Review the resulting diff, build once, and commit `go.mod` and `go.sum`.

## How the content is organized

Each product's documentation is structure the same, and which one a page belongs in decides how it is
written. Two main folders are common:

- `concepts/` - how the product works and what its terms mean. Read to form a mental model.
- `reference/`- Reference describes, it does not instruct: a procedure spanning several screens
  is a how-to guide that the reference page links to.
  - `gui/` - one page per screen or tab of the management GUI, mirroring its navigation, with one
  section per field. 
  - `api/` - same for API (not yet prepared)

A field's entry states what the setting does and what may be put in it:

```markdown
### Connection Idle Timeout {#httpConnectionIdleTimeout}

The idle timeout for an HTTP connection. Idle time is a period in which there are no active requests
on the connection.

- **Values:** [duration](../value-types#duration)
- **Default:** `300s`
```

Never carry a default over from older documentation without checking it against the product source -
the in-app help these pages replaced had five defaults that no longer matched the code.

The anchor is the field's form control name in the product, so that the GUI can link to it, and it
has to be unique on the page. Where a screen shows the same name twice - a settable field and a
read-only table column for the same property - the settable field keeps the bare name and the column
takes a `-column` suffix (`scheduleCron` and `scheduleCron-column`). Read-only screens document
their columns and their action buttons in the same `###` structure; `###` is reserved for those
entries, so a group of fields is introduced with `##` or with plain prose, never with `###`.

Other sections/folders are added as needed to provide helpful navigation. These should be task-oriented guides,
each starting from something the reader wants to achieve. A flat list grouped under topic headings on its landing page;
a heading becomes a directory once it outgrows the grouping.

## Linking from the product GUI

The Aero management GUI links into the `reference/` section: a screen's Help button opens its
reference page, and the help icon next to a field opens that field's section. The URLs are built in
the product from a fixed path layout, not looked up, so a handful of things here are load-bearing:

- `content/{lang}/{module}/{version}/` is the layout the product assumes, with the module directories
  named `platform` and `waap`, and version directories named `<major>.<minor>.x`.
- A reference page's URL path must not change. When a page has to move, keep an `aliases` entry in
  its front matter. Concept pages and the task guides (`operations/` for the platform, `how-to/` for
  WAAP) are not linked from the product and may be reorganised freely.
- Any heading a field links to carries an **explicit** anchor id - `### Connection Timeout {#connectionTimeout}` -
  and that id never changes, in any language. Hugo's generated anchors come from the heading text and
  would differ between the English and the German page; the product can only link one id.
- `defaultContentLanguageInSubdir: false` and `defaultContentLanguage: en` stay as they are in
  `hugo.yaml`. Flipping either changes every published English URL and breaks help links in appliances
  already in the field.
- A released appliance links to `<major>.<minor>.x`, so `make prepare-release` has to have run by the
  time that appliance ships.

The full contract, including how the product resolves language and version, is
`documentation/user-manual-contract.md` in the `aero-mgmt-app` repository.

## Draft pages

A page with `draft: true` in its front matter is left out of the build entirely, so nothing may link
to it from a published page - Hugo cannot resolve the link and silently emits a dead one.

The High Availability pages are drafts until the platform's **1.1** release ships. To publish them,
remove `draft: true` from all four:

- `content/en/platform/latest/reference/gui/configuration/high-availability.md`
- `content/en/platform/latest/reference/gui/system-management/high-availability.md`
- `content/en/platform/latest/operations/ha/_index.md`
- `content/en/platform/latest/operations/ha/set-up-an-ha-cluster.md`

then re-list the guide under a "High availability" heading on
`content/en/platform/latest/operations/_index.md`, and restore the links to the HA reference pages in
`concepts/configuration-lifecycle.md` and `reference/glossary.md`, where they are currently plain
text. The management GUI already links to both HA reference pages - those screens appear whenever the
appliance reports HA support - so publishing them also fixes those help links.

## Making a release

A version is a directory. `latest` is the documentation under development, and a
release is a frozen copy of it beside it, named after the release. Products
version independently, and the version selector in the header is built from the
directories that exist.

1. Check that the documentation about to be frozen has no dead references, and
   fix what it reports:

```bash
make check-links VERSION=latest
```

2. Freeze the current documentation of the product being released:

```bash
make prepare-release RELEASE=waap/0.6.x
```

3. Review the changes and then commit it to `main`:

```bash
git add content/en/waap/0.6.x
git commit -m "Release the Aero WAAP documentation as 0.6.x"
git push
```

Every push to `main` runs the `Publish` workflow, which
builds the site and replaces the `gh-pages` branch with it.
`pull requests` and pushes to other branches only run the `Build` workflow, which checks that the
site still builds.

## Retiring a release

`latest` always carries a banner saying that it is not a release, linking to the
newest one that is. Releases carry no banner until they reach their end of
life, which is a list in `hugo.yaml`:

```yaml
params:
  eol:
    - waap/0.5.x
```

Those versions show a banner saying they are no longer maintained, linking to the
current documentation.
