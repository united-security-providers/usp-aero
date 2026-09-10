---
title: "Local backups and restore"
weight: 30
---

# Local backups and restore

## Create Backup

Creates a new backup archive of this USP Aero instance that can be downloaded directly.

It will not be stored locally on the appliance in contrast to the automated backup jobs!

### Type {#type}

- **Values:** `Full (incl. Keys)`, `Full (no Keys)`
  - **Full (incl. Keys)** - full backup which also contains all private keys.
  - **Full (no Keys)** - full backup but private keys are excluded.
- **Default:** `Full (incl. Keys)`

## Local Backups

Lists the local backups produced by a backup job whose target is "Local" (see
[Backup targets](backup-targets)). A local backup can be restored, downloaded or deleted from here.

### Creation date {#name}

The date and time this backup was created.

### Type {#type-column}

- **Values:** `Full (incl. Keys)`, `Full (no Keys)`

### File size {#fileSize}

The size of the backup archive file.

### Restore {#restore}

Restores this USP Aero instance from this local backup, after confirmation.

### Download {#download}

Downloads this backup archive file.

### Delete {#delete}

Permanently deletes this local backup.

## Restore Backup

Restores this USP Aero instance from a backup archive. Drag and drop the backup file into the
predefined field or choose the file manually, then confirm the restore.

### Backup file {#file}

- **Values:** a `.tar.gz` backup archive file

### Local Backup {#localBackup}

Instead of uploading a file, choose one of the existing [Local Backups](#local-backups) to restore
from. Only shown when at least one local backup exists.

- **Values:** one of the existing local backups, or none
