---
title: "Local Users"
weight: 10
---

# Local Users

Configure local system user accounts here.

## Local users list

### Add User {#addUserButton}

Click the "Add User" button to add a new user.

### Username {#username-column}

The name the user signs in with. See [Username](#username) below.

### Display name {#displayname-column}

The name shown for the user in the GUI. See [Display name](#displayname) below.

### E-Mail {#email-column}

The address stored for the user. See [E-Mail](#email) below.

### Role {#role-column}

The role assigned to the user. See [Role](#role) below.

- **Values:** `Administrator`, `Viewer` (shown as `-` if no role could be determined)

### Edit {#edit-user}

Click a table row, or its pencil icon, to open that user in the edit dialog.

### Delete {#delete-user}

Click the "trashcan" icon to delete a user.

## Create or update a user

When adding a new user, the following fields must be filled in. The same dialog is used to edit an
existing user; when editing, the username cannot be changed and the password is optional — leave it
blank to keep the current password.

### Username {#username}

The user account name used for the login.

- **Values:** free text, at most 32 characters; letters and digits only. Cannot be changed once the user has been created
- **Required:** yes

### Display name {#displayname}

The display name for the user (e.g. the real name and surname).

- **Values:** free text, at most 32 characters
- **Required:** yes

### E-Mail {#email}

The e-mail address of the user.

- **Values:** a valid e-mail address, at most 254 characters
- **Required:** yes

### Role {#role}

Select the role that the user should have. See
[Roles and permissions](../../../concepts/roles-and-permissions) for what each role can do.

- **Values:** `Administrator`, `Viewer`.
- **Required:** yes

### Password {#password}

The password used by this user account for the login.

- **Values:** free text, at least 8 characters
- **Required:** yes when creating a new user; optional when editing — leave blank to keep the current password
