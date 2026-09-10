# USP Aero documentation

This repository contains the USP Aero documentation, published under https://docs.united-security-providers.ch/usp-aero/.
The content is in `content/en/<product>/<version>/`.

## Building

There are no required dependencies.
Hugo and Pagefind will always be downloaded with the make target `download-tools` on first use.

```bash
make serve           # build, then http://localhost:1313/usp-aero/ with live reload
make build           # build into public/, search index included
make clean           # remove the build output; bin/ stays
make download-tools  # fetch the toolchain without building
make clean-tools     # remove the toolchain from bin/
```

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
  its front matter. Pages in `concepts/` and `how-to/` are not linked from the product and may be
  reorganised freely.
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

## Making a release

A version is a directory. `latest` is the documentation under development, and a
release is a frozen copy of it beside it, named after the release. Products
version independently, and the version selector in the header is built from the
directories that exist.

1. Freeze the current documentation of the product being released:

```bash
make prepare-release RELEASE=waap/0.6.x
```

2. Review the changes and then commit it to `main`:

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
