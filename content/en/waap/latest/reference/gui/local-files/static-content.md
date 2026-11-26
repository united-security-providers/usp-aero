---
title: "Static Content"
weight: 10
---

# Static Content

Files that WAAP serves itself, without forwarding the request to a backend. Upload a single file, or
an archive to add several at once.

## List of static content files

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

## Static Content file details

Shows and edits a static content file.

### Name {#name}

The file's name.

- **Values:** free text without the characters `/ \ < > | : & ( ) ; * ?`
- **Default:** none
- **Required:** yes

### Content Type {#contentType}

The MIME content type served for this file. Changing it changes how a browser treats the content.

- **Values:** `binary`, `text/plain`, `text/html`, `text/css`, `text/javascript`, `application/json`
- **Default:** `text/plain`
- **Required:** yes

### Content {#content}

The file's content, edited in place. Binary files are uploaded rather than typed.

- **Values:** free text
