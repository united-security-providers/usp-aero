---
title: "Maintenance Pages"
weight: 30
---

# Maintenance Pages

Maintenance pages that a virtual host can serve on selected routes instead of forwarding the request
to the backend. See [Maintenance Pages](../vhosts/error-pages#maintenance-pages). Create a page in
place, upload a single file, or upload an archive to add several at once. "Download All" downloads all
maintenance pages as an archive.

A maintenance page that a virtual host references cannot be deleted, even if the maintenance page is
inactive on that virtual host. Remove it from the virtual host first.

## List of maintenance pages

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

## Maintenance Page details

Shows and edits a local maintenance page.

### Name {#name}

A label used to reference this file in other configuration screens. Must be unique among the
maintenance pages.

- **Values:** free text without the characters `/ \ < > | : & ( ) ; * ?`
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

- **Values:** text of at most 1 MB. A `%` must start a response variable or be written as `%%`.
- **Default:** none
- **Required:** yes
