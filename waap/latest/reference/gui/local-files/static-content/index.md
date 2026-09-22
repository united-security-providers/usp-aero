> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Static Content

Files that WAAP serves itself, without forwarding the request to a backend. Upload a single file, or
an archive to add several at once.

## Static Content file details

Allows to view/edit a local Static Content file's details.

### Name {#name}

A label used to reference this file in other configuration screens.

- **Values:** free text; the characters `/ \ < > | : & ( ) ; * ?` are not allowed
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
