---
title: 'Header Filtering Classes'
weight: 50
---
<!-- source repo: header-filter-go, file: internal/config/header_class.go -->
# Header Filtering Classes

> [!NOTE]
> Note that HTTP headers are case-insensitive; listed lowercase below.

## Request Headers

For request headers one of the following allow classes can be selected.
The classes are cumulative, each one being a superset of
the previous: `EXTENDED` ⊇ `STANDARD` ⊇ `RESTRICTED`. The default is `STANDARD`.

### `RESTRICTED`

The smallest class: the HTTP/2 pseudo-headers plus the most common browser
request headers.

* `:path`
* `:method`
* `:authority`
* `:scheme`
* `accept`
* `accept-encoding`
* `accept-language`
* `content-length`
* `content-type`
* `cookie`
* `expect`
* `host`
* `referer`
* `transfer-encoding`
* `upgrade-insecure-requests`
* `user-agent`
* `x-forwarded-proto`
* `x-request-id`

### `STANDARD`

`RESTRICTED` plus the full set of standard web request headers. This is the default.

All headers from `RESTRICTED`, plus:

* `access-control-request-headers`
* `access-control-request-method`
* `authorization`
* `cache-control`
* `connection`
* `content-encoding`
* `content-language`
* `content-location`
* `date`
* `dpop`
* `if-match`
* `if-modified-since`
* `if-none-match`
* `if-range`
* `if-unmodified-since`
* `max-forwards`
* `origin`
* `priority`
* `range`
* `sec-fetch-dest`
* `sec-fetch-mode`
* `sec-fetch-site`
* `sec-fetch-storage-access`
* `sec-fetch-user`
* `sec-purpose`
* `sec-websocket-extensions`
* `sec-websocket-key`
* `sec-websocket-protocol`
* `sec-websocket-version`
* `te`
* `upgrade`
* `x-requested-with`

### `EXTENDED`

`STANDARD` plus client hints and other modern browser/SPA/mobile request headers.

All headers from `STANDARD`, plus:

* `available-dictionary`
* `content-digest`
* `dictionary-id`
* `downlink`
* `ect`
* `from`
* `idempotency-key`
* `last-event-id`
* `prefer`
* `repr-digest`
* `rtt`
* `save-data`
* `sec-ch-device-memory`
* `sec-ch-dpr`
* `sec-ch-prefers-color-scheme`
* `sec-ch-prefers-reduced-motion`
* `sec-ch-prefers-reduced-transparency`
* `sec-ch-ua`
* `sec-ch-ua-arch`
* `sec-ch-ua-bitness`
* `sec-ch-ua-form-factors`
* `sec-ch-ua-full-version-list`
* `sec-ch-ua-mobile`
* `sec-ch-ua-model`
* `sec-ch-ua-platform`
* `sec-ch-ua-platform-version`
* `sec-ch-ua-wow64`
* `sec-ch-viewport-height`
* `sec-ch-viewport-width`
* `sec-ch-width`
* `sec-gpc`
* `service-worker-navigation-preload`
* `want-content-digest`
* `want-repr-digest`

## Response Headers

For response headers there is currently a single implicit allow class
that is always used when response filtering is enabled:

* `:status`
* `accept-ch`
* `accept-patch`
* `accept-post`
* `accept-ranges`
* `access-control-allow-credentials`
* `access-control-allow-headers`
* `access-control-allow-methods`
* `access-control-allow-origin`
* `access-control-expose-headers`
* `access-control-max-age`
* `activate-storage-access`
* `age`
* `allow`
* `attribution-reporting-register-source`
* `attribution-reporting-register-trigger`
* `cache-control`
* `cache-group-invalidation`
* `cache-groups`
* `clear-site-data`
* `connection`
* `content-digest`
* `content-disposition`
* `content-encoding`
* `content-language`
* `content-length`
* `content-location`
* `content-range`
* `content-security-policy`
* `content-security-policy-report-only`
* `content-type`
* `critical-ch`
* `cross-origin-embedder-policy`
* `cross-origin-embedder-policy-report-only`
* `cross-origin-opener-policy`
* `cross-origin-opener-policy-report-only`
* `cross-origin-resource-policy`
* `date`
* `deprecation`
* `dpop-nonce`
* `etag`
* `expires`
* `integrity-policy`
* `integrity-policy-report-only`
* `keep-alive`
* `last-modified`
* `link`
* `location`
* `nel`
* `no-vary-search`
* `origin-agent-cluster`
* `permissions-policy`
* `prefer`
* `preference-applied`
* `priority`
* `ratelimit`
* `ratelimit-limit`
* `ratelimit-policy`
* `ratelimit-remaining`
* `ratelimit-reset`
* `referrer-policy`
* `refresh`
* `reporting-endpoints`
* `repr-digest`
* `retry-after`
* `sec-websocket-accept`
* `sec-websocket-extensions`
* `sec-websocket-protocol`
* `sec-websocket-version`
* `server`
* `service-worker-allowed`
* `set-cookie`
* `speculation-rules`
* `strict-transport-security`
* `sunset`
* `supports-loading-mode`
* `timing-allow-origin`
* `transfer-encoding`
* `upgrade`
* `use-as-dictionary`
* `vary`
* `www-authenticate`
* `x-content-type-options`
* `x-dns-prefetch-control`
* `x-frame-options`
* `x-permitted-cross-domain-policies`
* `x-robots-tag`
