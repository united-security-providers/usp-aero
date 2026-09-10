---
title: "Configuration revisions"
weight: 20
---

# Configuration revisions

A configuration revision is a saved, numbered snapshot of a component's configuration. Editing a
setting changes the draft configuration; it is only captured as a revision when you click
**Create Revision** (see [Deploying a configuration](deploy)).

Each revision carries:

### Rev

The revision number.

### Schema

The schema version the revision was created against.

### Author

The user who created the revision.

### Message

An optional free-text message describing the change, entered when the revision was created.

### Created

The date and time the revision was created.

### Deployed

The date and time the revision was deployed, if it has been.

A revision that has not yet been activated can be reviewed before deployment; the GUI shows the
configuration properties that changed since the previous revision.
