---
title: "Error Pages"
weight: 50
---

# Error Pages

Configures custom error pages served by this virtual host instead of the backend's own response.
Click "Add error page" to add an entry.

### Response Status

The response status code (or a condition on the response, see below) that this entry applies to.

### Local Error Page

The [local error page](../local-files/error-pages) to serve for this entry. Manage the available
files from "Manage Local Error Pages".

### Overwrite Status Code

Optional. Overwrites the HTTP status code sent to the client with this one. Must be a valid status
code (400–599).

### Additional Header Condition

Optionally restricts an entry to responses matching a given response header, using an Equals,
Contains, Starts With, Ends With or Regex match.
