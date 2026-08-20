# USP Docs

The Hugo theme for USP product documentation. A site provides configuration and
Markdown only.

```bash
git submodule add https://github.com/united-security-providers/usp-docs-theme themes/usp-docs
```

## Configuration

```yaml
theme: usp-docs
title: 'USP NAS documentation'
copyright: '&copy; 2026 United Security Providers AG. All Rights Reserved.'

# Bare baseURL plus relativeURLs, so the output works under any path prefix.
baseURL: 'https://docs.united-security-providers.ch/'
relativeURLs: true

defaultContentLanguage: en
defaultContentLanguageInSubdir: false
languages:
  en:
    contentDir: content/en

markup:
  goldmark:
    renderer:
      unsafe: true                      # only if the content contains raw HTML

params:
  canonicalBase: 'https://docs.united-security-providers.ch/usp-nas/'
  homepage: 'https://docs.united-security-providers.ch/usp-nas'
  description: 'Documentation of the USP NAS'
  logo: images/USP-Logo-2023-ohne-claim-lang-white1.webp
  customStylesheet: stylesheets/site.css   # optional, in the site's own assets/
  eol: ['nas/0.5.x']                       # releases no longer maintained
  search:
    enabled: true                          # needs the Pagefind index, see below
  social:
    - icon: linkedin                       # linkedin and youtube are bundled
      link: https://www.linkedin.com/company/united-security-providers/
      name: United Security Providers on Linkedin
```

## Content

```
content/en/
├── _index.md          landing page
└── nas/
    ├── _index.md      layout: redirect
    ├── latest/        documentation under development
    └── 1.0.x/         a release
```

One directory per product, its subdirectories the versions. A single-product
site drops the product level and keeps the versions at the root, with no landing
page:

```
content/en/
├── _index.md          layout: redirect
├── latest/            documentation under development
└── 1.0.x/             a release
```

`latest` is the documentation under development and the theme hardcodes that
name. A product is entered at its newest release not listed in `eol`, or at
`latest` while it has none: that is where the landing-page link, `/<product>/`
and a search started outside a product all lead. `eol` names a release the way
its path does - `nas/0.5.x` with products, `0.5.x` without.

| Front matter | Meaning |
|---|---|
| `title` | heading and navigation label |
| `linkTitle` | shorter navigation label |
| `weight` | order in the navigation |
| `description` | meta description of the page |
| `hidden` | keep the page out of the navigation |
| `layout: redirect` | a product directory rather than a page |

Admonitions are GitHub alerts: `> [!TIP]`, `> [!WARNING]`, `> [!NOTE]`,
`> [!CAUTION]`, `> [!IMPORTANT]`.

## Search

[Pagefind](https://pagefind.app/) indexes the built pages, so Hugo runs twice:

```bash
hugo --gc --cleanDestinationDir
pagefind --site public --output-path static/pagefind --root-selector 'article.usp-prose'
hugo --gc --cleanDestinationDir
```

The bundle goes to `static/pagefind` so that `hugo server` serves it too;
gitignore that path.

Fonts: Montserrat (SIL OFL 1.1), Roboto Mono (Apache-2.0). Icons: Font Awesome
Free (CC BY 4.0).
