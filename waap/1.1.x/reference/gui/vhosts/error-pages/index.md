> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Error Pages & Maintenance Pages

The virtual host's "Error Pages & Maintenance Pages" tab has two sections:

- [Error Pages](#error-pages): serve a local error page instead of the backend's response when the
  response has a given status code.
- [Maintenance Pages](#maintenance-pages): serve a local maintenance page on selected routes without
  forwarding the request to the backend.

## Error Pages

Configures custom error pages served by this virtual host instead of the backend's own response. See
[Replace backend error pages](../../../application-integration/local-error-page).
Click "Add error page" to add an entry.

### Response Status {#responseStatusCode}

The response status code (or a status class) that this entry applies to. `4xx` and `5xx` match every
status code of that class.

- **Values:** `400`, `401`, `403`, `404`, `405`, `4xx`, `500`, `501`, `502`, `503`, `504`, `505`, `5xx`
- **Default:** none
- **Required:** yes

### Local Error Page {#localErrorPageId}

The [local error page](../local-files/error-pages) to serve for this entry. Manage the available
files from "Manage Local Error Pages".

- **Values:** one of the configured local error pages
- **Default:** none
- **Required:** yes

### Overwrite Status Code {#overwriteStatusCode}

Overwrites the HTTP status code sent to the client with this one. If not set, the client receives the
original status code.

- **Values:** a number between `400` and `599`
- **Default:** none

### Additional Header Condition

Optionally restricts an entry to responses matching one or more response headers, using an Equals,
Contains, Starts With, Ends With or Regex match. Add up to 16 conditions per entry with the
"Add condition" button. An entry only applies if all of its conditions match.

#### Additional Header Condition {#headerConditionEnabled}

Turns the header condition on for this entry. Turning it off clears the conditions you have entered.

- **Values:** `on` or `off`
- **Default:** `off`

#### Type {#type}

The source of the header to match.

- **Values:** `Response`
- **Default:** `Response`
- **Required:** yes

#### Name {#name}

The name of the header to match, case-insensitive.

- **Values:** a valid HTTP header name, at most 256 characters
- **Default:** none
- **Required:** yes

#### Match Type {#matchType}

How the header value is compared.

- **Values:** `Equals`, `Contains`, `Starts With`, `Ends With`, `Regex`
- **Default:** `Contains`
- **Required:** yes

#### Value {#value}

The value the header is compared against. Must not contain control characters (e.g. CR or LF). When
**Match Type** is `Regex`, must be a valid regular expression.

- **Values:** free text, at most 4096 characters
- **Default:** none
- **Required:** yes

### Which entry applies

- Two entries whose statuses overlap must have different header conditions. Statuses overlap if they
  are equal, or if one is a status class and the other a code of the same class (for example `5xx` and
  `503`). An entry without header conditions counts as one condition set, so two such entries must not
  overlap.
- Entries with header conditions are checked before entries without, whatever their order in the
  list. The first matching entry is served.
- On routes with an active [maintenance page](#maintenance-pages), no error page is served.

## Maintenance Pages

Serves a [local maintenance page](../local-files/maintenance-pages) on selected routes of this
virtual host. Requests to these routes are answered directly by Aero WAAP and are not forwarded to the
backend. See [Show a maintenance page](../../../application-integration/maintenance-page).

### Active {#maintenancePageEnabled}

Turns the maintenance page on or off for this virtual host. The other settings are kept while it is
off.

- **Values:** `on` (Active) or `off` (Inactive)
- **Default:** `off`

### Maintenance Page {#localMaintenancePageId}

The [local maintenance page](../local-files/maintenance-pages) to serve. Manage the available files
from "Manage Maintenance Pages".

- **Values:** one of the configured local maintenance pages
- **Default:** none
- **Required:** yes, if **Active** is on

### Routes {#routeIds}

The routes of this virtual host on which the maintenance page is served. Not available while
**All routes** is on. Deleting a route removes it from this list.

- **Values:** one or more routes of this virtual host
- **Default:** none
- **Required:** yes, if **Active** is on and **All routes** is off

### All routes {#allRoutes}

Serves the maintenance page on all routes of this virtual host, including routes added later.
Turning it on clears the routes selected in **Routes**, after a confirmation.

- **Values:** `on` or `off`
- **Default:** `off`

### Status Code {#statusCode}

The HTTP status code sent to the client together with the maintenance page.

- **Values:** a number between `100` and `599`
- **Default:** `503`
- **Required:** yes
