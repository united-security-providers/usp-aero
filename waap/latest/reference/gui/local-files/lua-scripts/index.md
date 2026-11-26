> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Lua Scripts

Lua scripts stored on the appliance. Create a script in place, upload a single file, or upload an
archive to add several at once. "Download All" downloads all Lua scripts as an archive.

## Lua Script details

Allows to view/edit a Lua script's details.

### Name {#name}

A label used to reference this file in other configuration screens. Must be unique among the Lua
scripts.

- **Values:** free text; the characters `/ \ < > | : & ( ) ; * ?` are not allowed
- **Default:** none
- **Required:** yes

### Content {#content}

The Lua script's source, edited in place. Unlike an error or maintenance page, a Lua script has no
content type and no response variables: it is executed, not served, so a `%` is ordinary Lua.

- **Values:** text, at most 1 MB
- **Default:** none
- **Required:** yes
