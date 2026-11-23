---
title: "Configuration revisions"
weight: 20
---

# Configuration revisions

A configuration revision is a saved, numbered snapshot of a component's configuration. Editing a
setting changes the draft configuration; it is only captured as a revision when you click
**Create Revision** below (reached via **Review changes** on [Deploying a configuration](deploy)).

This screen also shows, for any revision, what changed in the configuration compared with the
previous one.

## Revision details

While reviewing unreleased draft changes, only the changes themselves are shown (see
[Configuration changes](#configuration-changes)) — the fields below only apply once the changes
have been captured as a numbered revision.

### Created {#updatedAt}

The date and time the revision was created.

### Deployed {#activatedAt}

The date and time the revision was deployed, shown once it has been.

### Schema {#schemaVersion}

The schema version the revision was created against.

### Author {#author}

The user who created the revision.

### Message {#comment}

The message describing the change. When a revision is created through **Create Revision** below (or
through [Rollback revision](history-and-rollback#rollback)) a message is required; revisions
created another way may show no message.

## Configuration changes

Any [configuration validation errors](../../validation-errors) for the revision are shown here.

### Configuration diff {#diffContent}

For each part of the configuration that changed, shows the previous and new content side by side,
compared against the previous revision (or, for the very first revision, shown on its own).

## Actions

**Create Revision** and **Reset Changes** are only available while reviewing unreleased draft
changes. When viewing a previously deployed revision that is not the latest one, a
**Rollback revision** button is available instead — see
[History and rollback](history-and-rollback#rollback).

### Create Revision {#createRevision}

Click **Create Revision** to save the current draft changes as a new, numbered revision in the
configuration storage. This opens a dialog asking for a message describing the change. This new
revision can then be activated by [deploying it](deploy).

### Message {#message}

A message describing the change, entered when creating the revision.

### Reset Changes {#resetChanges}

Opens a confirmation dialog; confirming discards the current draft changes and reverts the
configuration back to its last revision.
