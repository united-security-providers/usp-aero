---
title: "Local Error Pages"
weight: 20
---

# Local Error Pages

Error pages that a virtual host can serve instead of the backend's response. See
[Error Pages](../vhosts/error-pages#error-pages). Create a page in place, upload a single file, or
upload an archive to add several at once. "Download All" downloads all error pages as an archive.

An error page that a virtual host uses cannot be deleted. Remove it from the virtual host first.

## List of error pages

### Name {#name-column}

The file's [name](#name).

### Content Type {#contentType-column}

The file's [content type](#contentType).

### Size {#size-column}

The size of the file's content.

### Modified {#updatedAt-column}

When the file was last changed.

### Actions {#actions}

Open, download or delete a file.

## Error Page details

Shows and edits a local error page.

### Name {#name}

A label used to reference this file in other configuration screens. Must be unique among the error
pages.

- **Values:** free text without the characters `/ \ < > | : & ( ) ; * ?`
- **Default:** none
- **Required:** yes

### Content Type {#contentType}

The MIME content type served for this error page.

- **Values:** `text/plain`, `text/html`, `application/json`
- **Default:** `text/plain`
- **Required:** yes

### Content {#content}

The error page's content, edited in place. The content may contain
[response variables](#response-variables).

- **Values:** text of at most 1 MB. A `%` must start a response variable or be written as `%%`.
- **Default:** none
- **Required:** yes

## Response variables

Error and maintenance pages may contain Envoy
[substitution commands](https://www.envoyproxy.io/docs/envoy/latest/configuration/observability/access_log/usage#command-operators),
written as `%COMMAND%` or `%COMMAND(ARGUMENT)%`. They are replaced when the page is served, for
example:

```html
<p>Error %RESPONSE_CODE% for %REQ(:PATH)%</p>
<p>Request ID: %REQ(X-REQUEST-ID)%</p>
```

> [!TIP]
> A `%` that does not start a known command is rejected when you save. Write `%%` for a literal percent
> sign, for example `100%%`.
