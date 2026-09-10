---
title: "Identity Providers"
weight: 30
draft: true
---

# Identity Providers

Here you can configure additional identity providers used to authenticate users that access this
Aero Management UI.

## Tab "Settings"

### Name

Configures the name for this provider, such as the name of the organization or company operating the
LDAP service.

### Host / Port

Configures the hostname or IP address and listener port of the LDAP service.

### Switch "LDAPS"

Enable this switch to enable TLS for the connection from the Aero Management UI to the LDAP service.

### Switch "Skip Certificate Validation"

If TLS is enabled, the validation of the LDAP listener's server certificate can be disabled with this
switch. This can make sense if self-signed certificates are used (e.g. in a test environment).

### Link "Upload trusted CA Certificates"

If certificate validation is not disabled, a matching certificate from a trusted Certificate
Authority must be uploaded on the [Certificates](../configuration/certificates) screen.

### LDAP DN of the service user for the initial bind

Specifies the DN (Distinguished Name) of the technical / service user account that is used for the
bind connection to the LDAP service.

### LDAP password of the service user

Specifies the password of the technical / service user account that is used for the bind connection
to the LDAP service.

### LDAP DN where to search for the users

Specifies the DN (Distinguished Name) where to search for user accounts.

### LDAP filter to search for users

Specifies the search filter used to search users on the configured DN.

### LDAP DN where to search for groups

Specifies the DN (Distinguished Name) where to search for groups.

### LDAP filter to search for groups

Specifies the search filter used to search groups on the configured DN.

## Advanced Settings

This section allows to define optional additional settings which specify which LDAP attribute is
mapped to which user account field.

### User Attribute Mapping

- **Username** - Name of LDAP attribute which contains the username.
- **ID** - Name of LDAP attribute which contains the user ID.
- **Email** - Name of LDAP attribute which contains the user email address.
- **Name** - Name of LDAP attribute which contains the real name of the user, e.g. John Doe.
- **Preferred Username** - Name of LDAP attribute which contains the user's preferred username.

### Group Attribute Mapping

- **Name** - Name of LDAP attribute which contains the name of the group the user belongs to.
- **Group Member Matcher** - Defines how a user is matched to a group, as a pair of a **Group
  Attribute** and a **User Attribute**: a user belongs to a group when the value of the user's
  configured attribute matches the value of the group's configured attribute.

## Tab "Role Mapping"

In this section you have to specify what LDAP group a user must belong to in order to have a certain
role assigned to them.

### Administrator

Configure the name of the LDAP group for all users with the "Administrator" role.

### Viewer

Configure the name of the LDAP group for all users with the "Viewer" role.
