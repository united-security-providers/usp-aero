> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Local Error Pages

Error pages that a virtual host can serve instead of the backend's response; see
[Error Pages](../vhosts/error-pages#error-pages). Create a page in place, upload a single file, or
upload an archive to add several at once. "Download All" downloads all error pages as an archive.

An error page that a virtual host uses cannot be deleted. Remove it from the virtual host first.

## Error Page details

Allows to view/edit a local error page's details.

### Name {#name}

A label used to reference this file in other configuration screens. Must be unique among the error
pages.

- **Values:** free text; the characters `/ \ < > | : & ( ) ; * ?` are not allowed
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

- **Values:** text, at most 1 MB; a `%` must start a response variable or be written as `%%`
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
