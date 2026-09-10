---
title: "History and rollback"
weight: 30
---

# History and rollback

## Configuration History

Every revision that was ever created for a component is listed in its Configuration History, with
its revision number, schema version, author, message and creation date. Click "Show revision
details" to open a revision (see [Configuration revisions](revisions)).

## Rollback revision

An earlier revision can be rolled back. Rolling back a revision does not simply reactivate the old
one: it creates a new revision with the old revision's content, which is then deployed like any other
revision.
