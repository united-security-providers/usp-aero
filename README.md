# USP Aero documentation

This repository contains the USP Aero documentation, published under https://docs.united-security-providers.ch/usp-aero/.
The content is in `content/en/<product>/<version>/`.

## Building

There are no required dependencies.
Hugo and Pagefind will always be downloaded with the make target `download-tools` on first use.

```bash
make serve           # build, then http://localhost:1313/ with live reload
make build           # build into public/, search index included
make clean           # remove the build output; bin/ stays
make download-tools  # fetch the toolchain without building
make clean-tools     # remove the toolchain from bin/
```

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
