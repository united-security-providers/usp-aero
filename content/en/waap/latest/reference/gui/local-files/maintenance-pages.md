---
title: "Maintenance Pages"
weight: 30
---

# Maintenance Pages

Maintenance pages that a virtual host can serve on selected routes instead of forwarding the request
to the backend; see [Maintenance Pages](../vhosts/error-pages#maintenance-pages). Create a page in
place, upload a single file, or upload an archive to add several at once. "Download All" downloads all
maintenance pages as an archive.

A maintenance page that a virtual host references cannot be deleted, even if the maintenance page is
inactive on that virtual host. Remove it from the virtual host first.

## Maintenance Page details

Allows to view/edit a local maintenance page's details.

### Name {#name}

A label used to reference this file in other configuration screens. Must be unique among the
maintenance pages.

- **Values:** free text; the characters `/ \ < > | : & ( ) ; * ?` are not allowed
- **Default:** none
- **Required:** yes

### Content Type {#contentType}

The MIME content type served for this maintenance page.

- **Values:** `text/plain`, `text/html`, `application/json`
- **Default:** `text/plain`
- **Required:** yes

### Content {#content}

The maintenance page's content, edited in place. The content may contain
[response variables](error-pages#response-variables).

- **Values:** text, at most 1 MB; a `%` must start a response variable or be written as `%%`
- **Default:** none
- **Required:** yes
