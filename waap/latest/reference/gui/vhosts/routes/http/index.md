> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# HTTP

## Allowed Methods {#allowedMethods}

Defines the HTTP methods to allow. Requests with other HTTP methods are rejected with status code
`405 Method Not Allowed`. The list of available methods on the left shows all
[IANA HTTP Methods](https://www.iana.org/assignments/http-methods/http-methods.xhtml). By default
`GET`, `HEAD`, `OPTIONS` and `POST` are allowed, as shown in the list of selected methods on the
right. Move methods left and right as desired and save.

- **Values:** any of the IANA HTTP methods (e.g. `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE`,
  `OPTIONS`, `CONNECT`, `TRACE`, and the WebDAV/versioning methods)
- **Default:** `GET`, `HEAD`, `OPTIONS`, `POST`
- **Required:** yes

## Request Body Inspection

### Maximum payload size {#bodySizeLimit}

The maximum size of the request body that will be inspected.

- **Values:** a number followed by a unit `B`, `KB`, `MB`, `GB` or `TB` (e.g. `10KB`), from 1 byte
  up to 1 GB
- **Default:** `10kb`
- **Required:** yes

### Disable rule engine for body payload {#bodyAccess}

If enabled, all [Rule Engine](../rule-engine) rules that inspect or parse the request body
are inactive and will be skipped for this route.

- **Values:** `on` or `off`
- **Default:** `off`
- **Required:** yes
