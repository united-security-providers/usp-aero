> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Cookies

## Cookie Manipulation

Allows to change cookies on the fly, configured separately for the "Request" and "Response" tabs.
Cookie names must be unique within a tab. Up to 64 manipulations may be added per tab; click the "+"
icon to add one.

### Action {#action}

The change to make to the cookie.

- **Remove** - Removes the cookie with the given name.
- **Add if absent** - Adds the cookie if no cookie with that name exists yet.
- **Overwrite if exists** - Overwrites the cookie's value if it already exists.
- **Overwrite if exists or add** - Overwrites the cookie's value if it exists, otherwise adds it.
- **Modify attributes if cookie present** - Changes the cookie's attributes if the cookie is present,
  without changing its value. Only available on the "Response" tab.

- **Values:** `Remove`, `Add if absent`, `Overwrite if exists`, `Overwrite if exists or add` for
  either tab, plus `Modify attributes if cookie present` for the "Response" tab
- **Default:** none
- **Required:** yes

### Cookie Name {#name}

The name of the cookie.

- **Values:** letters, digits and the characters `!#$%&'*+.^_`|~-`, at most 256 characters
- **Default:** none
- **Required:** yes

### Value {#value}

The value to set. Not shown, and not required, when the action is `Remove`, or, on the "Response"
tab, `Modify attributes if cookie present`.

- **Values:** free text; spaces, quotes, commas, semicolons and backslashes are not allowed, at most
  4096 characters
- **Default:** none

## Attributes {#attributes}

Used with "Modify attributes if cookie present", on the "Response" tab; at least one attribute is
required for that action. Attribute names must be unique within an entry (case-insensitive). Up to
32 attribute manipulations may be added; click the "+" icon to add one.

### Action {#action-attribute}

The change to make to the attribute.

- **Values:** `Remove`, `Add if absent`, `Overwrite if exists`, `Overwrite if exists or add`
- **Default:** none
- **Required:** yes

### Attribute Name {#name-attribute}

The name of the attribute.

- **Values:** letters, digits and the characters `!#$%&'*+.^_`|~-`, at most 256 characters
- **Default:** none
- **Required:** yes

### Value {#value-attribute}

The value to set. Not shown, and not required, when the action is `Remove`.

- **Values:** free text; quotes, semicolons and backslashes are not allowed, at most 4096 characters
- **Default:** none
