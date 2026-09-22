HUGO_VERSION := 0.165.0
PAGEFIND_VERSION := 1.5.2
LYCHEE_VERSION := 0.24.2

BIN := bin
HUGO := $(BIN)/hugo-$(HUGO_VERSION)
PAGEFIND := $(BIN)/pagefind-$(PAGEFIND_VERSION)
LYCHEE := $(BIN)/lychee-$(LYCHEE_VERSION)

HUGO_BASE := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)
HUGO_ASSET := hugo_extended_$(HUGO_VERSION)_linux-amd64.tar.gz
PAGEFIND_BASE := https://github.com/Pagefind/pagefind/releases/download/v$(PAGEFIND_VERSION)
PAGEFIND_ASSET := pagefind_extended-v$(PAGEFIND_VERSION)-x86_64-unknown-linux-musl.tar.gz
LYCHEE_BASE := https://github.com/lycheeverse/lychee/releases/download/lychee-v$(LYCHEE_VERSION)
LYCHEE_DIR := lychee-x86_64-unknown-linux-musl
LYCHEE_ASSET := $(LYCHEE_DIR).tar.gz
LYCHEE_FLAGS := --no-progress --include-fragments --index-files index.html

THEME := github.com/united-security-providers/usp-docs-hugo-theme
THEME_VERSION := latest

DEV_VERSION := latest
VERSION := all
RELEASE_PRODUCT = $(firstword $(subst /, ,$(RELEASE)))
RELEASE_VERSION = $(word 2,$(subst /, ,$(RELEASE)))
RELEASE_EXTRA = $(word 3,$(subst /, ,$(RELEASE)))

.PHONY: download-tools
download-tools: $(HUGO) $(PAGEFIND) $(LYCHEE)

$(HUGO):
	@mkdir -p $(BIN)
	@echo "Fetching Hugo $(HUGO_VERSION) into $(BIN)/"
	@tmp=$$(mktemp -d) && trap 'rm -rf "$$tmp"' EXIT && \
	  curl -sSfL -o "$$tmp/asset" "$(HUGO_BASE)/$(HUGO_ASSET)" && \
	  curl -sSfL "$(HUGO_BASE)/hugo_$(HUGO_VERSION)_checksums.txt" \
	    | grep " $(HUGO_ASSET)$$" | sed 's|$(HUGO_ASSET)|asset|' > "$$tmp/sum" && \
	  (cd "$$tmp" && sha256sum -c sum > /dev/null) && \
	  tar -xzf "$$tmp/asset" -C "$$tmp" hugo && \
	  mv "$$tmp/hugo" "$@" && chmod +x "$@"

$(PAGEFIND):
	@mkdir -p $(BIN)
	@echo "Fetching Pagefind $(PAGEFIND_VERSION) into $(BIN)/"
	@tmp=$$(mktemp -d) && trap 'rm -rf "$$tmp"' EXIT && \
	  curl -sSfL -o "$$tmp/asset" "$(PAGEFIND_BASE)/$(PAGEFIND_ASSET)" && \
	  curl -sSfL "$(PAGEFIND_BASE)/$(PAGEFIND_ASSET).sha256" \
	    | sed 's|$(PAGEFIND_ASSET)|asset|' > "$$tmp/sum" && \
	  (cd "$$tmp" && sha256sum -c sum > /dev/null) && \
	  tar -xzf "$$tmp/asset" -C "$$tmp" pagefind_extended && \
	  mv "$$tmp/pagefind_extended" "$@" && chmod +x "$@"

$(LYCHEE):
	@mkdir -p $(BIN)
	@echo "Fetching lychee $(LYCHEE_VERSION) into $(BIN)/"
	@tmp=$$(mktemp -d) && trap 'rm -rf "$$tmp"' EXIT && \
	  curl -sSfL -o "$$tmp/asset" "$(LYCHEE_BASE)/$(LYCHEE_ASSET)" && \
	  curl -sSfL "$(LYCHEE_BASE)/$(LYCHEE_ASSET).sha256" \
	    | sed 's|$(LYCHEE_ASSET)|asset|' > "$$tmp/sum" && \
	  (cd "$$tmp" && sha256sum -c sum > /dev/null) && \
	  tar -xzf "$$tmp/asset" -C "$$tmp" --strip-components=1 $(LYCHEE_DIR)/lychee && \
	  mv "$$tmp/lychee" "$@" && chmod +x "$@"

.PHONY: build
build: download-tools
	$(HUGO) --gc --cleanDestinationDir
	rm -rf static/pagefind
	$(PAGEFIND) --site public \
	            --output-path static/pagefind \
	            --root-selector 'article.usp-prose'
	$(HUGO) --gc --cleanDestinationDir

.PHONY: serve
serve: build
	$(HUGO) server

# Checks every link, heading anchor and image of one version - VERSION=0.5.x -
# or of the whole site with VERSION=all. It depends on build, so it always looks
# at output that matches the content: a check against a stale build silently
# reports yesterday's answer.
#
# http(s) links are requested too, every run. A site that has gone away is the
# kind of dead link nobody notices for years, and a flaky host costing a rerun
# is the better trade. OFFLINE=1 skips them when there is no network, and says
# loudly that it did.
#
# Releases get a second check on top: a link into `latest` resolves, so lychee
# is right not to mind, but it points a frozen release at documentation that
# keeps changing. Both checks always run, so one round reports everything.
.PHONY: check-links
check-links: build
	@set -f; site=$(CURDIR)/public; status=0; \
	base=$$($(HUGO) config | sed -n "s/^baseurl = '\(.*\)'/\1/p"); \
	prefix=$$(echo "$$base" | sed -E 's|^[a-z]+://[^/]*/?||; s|/$$||'); \
	if [ "$(VERSION)" = all ]; then \
	  inputs="$$site/**/*.html $$site/**/*.txt $$site/**/*.xml"; \
	  releases=$$(set +f; ls -d $$site/*/*/ | grep -v '/latest/$$'); \
	else \
	  inputs=$$(set +f; ls -d $$site/*/$(VERSION) 2>/dev/null | sed 's|$$|/**/*.html|'); \
	  test -n "$$inputs" || { \
	    echo "No component has a version '$(VERSION)'. Built versions:"; \
	    (set +f; ls -d $$site/*/*/) | sed "s|$$site/|  |;s|/$$||"; exit 1; }; \
	  releases=$$(test "$(VERSION)" = $(DEV_VERSION) || (set +f; ls -d $$site/*/$(VERSION)/)); \
	fi; \
	$(LYCHEE) $(LYCHEE_FLAGS) $(if $(OFFLINE),--offline) --root-dir "$$site" \
	          --remap "^file://$$site/$$prefix/ file://$$site/" \
	          --remap "^file://$$site/$$prefix$$ file://$$site/" \
	          --remap "^$$base file://$$site/" \
	          $$inputs || status=$$?; \
	if [ -n "$$releases" ]; then \
	  echo "Checking that no release links to $(DEV_VERSION)"; \
	  (set +f; find $$releases -name index.html) \
	    | xargs awk -v prefix="$$prefix" -f scripts/frozen-links.awk \
	    && echo "No release links to $(DEV_VERSION)." \
	    || { echo "A release must not link to $(DEV_VERSION); it is still changing."; status=1; }; \
	fi; \
	if [ -n "$(OFFLINE)" ]; then \
	  echo; \
	  echo "WARNING: OFFLINE=1 - not one http(s) link was requested."; \
	  echo "         Re-run without it before trusting this result."; \
	fi; \
	exit $$status

.PHONY: update-theme
update-theme: $(HUGO)
	$(HUGO) mod get $(THEME)@$(THEME_VERSION)

.PHONY: prepare-release
prepare-release:
	@{ test -n "$(RELEASE_VERSION)" && test -z "$(RELEASE_EXTRA)"; } || \
	  { echo "Usage: make prepare-release RELEASE=<product>/<version>, for example RELEASE=waap/0.6.x"; exit 1; }
	@test "$(RELEASE_VERSION)" != "$(DEV_VERSION)" || \
	  { echo "$(DEV_VERSION) is the documentation under development, not a release"; exit 1; }
	@test -d content/en/$(RELEASE_PRODUCT)/$(DEV_VERSION) || \
	  { echo "No such documentation: content/en/$(RELEASE_PRODUCT)/$(DEV_VERSION)"; exit 1; }
	@test ! -e content/en/$(RELEASE) || \
	  { echo "Already exists: content/en/$(RELEASE)"; exit 1; }
	@cp -r content/en/$(RELEASE_PRODUCT)/$(DEV_VERSION) content/en/$(RELEASE)
	@echo "Froze content/en/$(RELEASE_PRODUCT)/$(DEV_VERSION) as content/en/$(RELEASE)."

.PHONY: clean
clean:
	rm -rf public resources static/pagefind .hugo_build.lock

.PHONY: clean-tools
clean-tools:
	rm -rf $(BIN)
