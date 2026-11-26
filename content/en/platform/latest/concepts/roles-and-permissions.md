---
title: "Roles and permissions"
weight: 30
---

# Roles and permissions

A local user, a user authenticated through an identity provider, or an
[API client](../reference/gui/user-management/api-clients) is assigned one of the following roles:

### Administrator

Can edit and deploy the configuration, can add or remove components, can install updates and manage local users.

### Viewer

Can only view the configuration but not make any changes.

## API clients {#api-clients}

An API client has the same permissions as a user with the same role, with these exceptions:

- It has no user profile and can't change a password.
- It can list the API clients, but it can't create, change or delete them, or regenerate their
  secrets. Only people can manage API clients. A client with the role `Administrator` can still manage
  local users.

Every change an API client makes is logged with its client ID, for example `ci-pipeline (API client)`.
See [Access the management API](../operations/api/access-the-management-api).
