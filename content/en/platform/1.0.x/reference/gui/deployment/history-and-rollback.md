---
title: "History and rollback"
weight: 30
---

# History and rollback

## Configuration History

Every revision that was ever created for a component is listed in its Configuration History. The
currently deployed revision is highlighted. Click a row, or **Show revision details**, to open a
revision (see [Configuration revisions](revisions)).

### Rev {#revision}

The revision number.

### Date {#updatedAt}

The date and time the revision was created.

### Schema {#schemaVersion}

The schema version the revision was created against.

### Author {#author}

The user who created the revision.

### Message {#comment}

The [message](revisions#message) describing the change, if one was entered.

### Show revision details {#showDetails}

Opens the [Configuration revisions](revisions) screen for that revision.

## Rollback revision

An earlier revision can be rolled back. Rolling back a revision does not simply reactivate the old
one: it creates a new revision with the old revision's content, which is then deployed like any
other revision (see [Deploy](deploy)). Rolling back also discards any unreleased draft changes for
the component.

### Rollback revision {#rollback}

Available when viewing a previously deployed revision (see [Configuration revisions](revisions))
that is not the latest one. Opens a dialog asking for a message describing the rollback, then
creates the new revision.

### Message {#message}

A message describing why the rollback was initiated, used for the new revision message created by the rollback.

