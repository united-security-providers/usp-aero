---
title: "Local Error Pages"
weight: 20
draft: true
---

# Local Error Pages

Allows to configure the local Error Pages used by virtual hosts; see
[Error Pages](../vhosts/error-pages).

## Error Page details

Allows to view/edit a local error page's details.

### Name {#name}

A label used to reference this file in other configuration screens.

- **Values:** free text; the characters `/ \ < > | : & ( ) ; * ?` are not allowed
- **Default:** none
- **Required:** yes

### Content Type {#contentType}

The MIME content type served for this error page.

- **Values:** `text/plain`, `text/html`, `application/json`
- **Default:** `text/plain`
- **Required:** yes

### Content {#content}

The error page's content, edited in place.

- **Values:** free text
