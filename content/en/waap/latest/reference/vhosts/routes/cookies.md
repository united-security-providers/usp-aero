---
title: "Cookies"
weight: 40
---

# Cookies

## Cookie Manipulation

Allows to change cookies on the fly, configured separately for the "Request" and "Response" tabs.

### Action

- **Remove** - Removes the cookie with the given name.
- **Add if absent** - Adds the cookie if no cookie with that name exists yet.
- **Overwrite if exists** - Overwrites the cookie's value if it already exists.
- **Overwrite if exists or add** - Overwrites the cookie's value if it exists, otherwise adds it.
- **Modify attributes if cookie present** - Changes the cookie's attributes if the cookie is present,
  without changing its value.

### Cookie Name

The name of the cookie. Only letters, digits and the characters `!#$%&'*+.^_`|~-` are allowed, at
most 256 characters.

### Value

The value to set. Spaces, quotes, commas, semicolons and backslashes are not allowed, at most 4096
characters.

### Attributes

Used with "Modify attributes if cookie present"; at least one attribute is required.

- **Attribute Name** - Only letters, digits and the characters `!#$%&'*+.^_`|~-` are allowed, at most
  256 characters.
- **Value** - Quotes, semicolons and backslashes are not allowed, at most 4096 characters.
