---
title: "Local backups and restore"
weight: 30
---

# Local backups and restore

## Create Backup

Creates a new backup archive of this USP Aero instance that can be downloaded directly.

Unlike the automated backup jobs, it is not stored on the appliance.

### Type {#type}

The content of the backup. It is always a full backup, which also contains all private keys.

- **Values:** `Full (incl. Keys)`
- **Default:** `Full (incl. Keys)`

> [!NOTICE]
> Backups always contain the private keys. Store backup archives securely.

## Local Backups

Lists the local backups produced by a backup job whose target is "Local" (see
[Backup targets](backup-targets)). A local backup can be restored, downloaded or deleted from here.

### Creation date {#name}

The date and time this backup was created.

### Type {#type-column}

The content of the backup.

- **Values:** `Full (incl. Keys)`

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

If the backup does not match the installed components, the dialog lists the differences before it
restores. A component may be installed but missing in the backup, or be backed up in a different
version than the installed one. The table shows the backup version and the installed version of each
such component. "Restore Anyway" restores the backup regardless. Otherwise adjust the installed
components on the [Components](../components) screen first.

### Backup file {#file}

- **Values:** a `.tar.gz` backup archive file

### Local Backup {#localBackup}

Instead of uploading a file, choose one of the existing [Local Backups](#local-backups) to restore
from. Only shown when at least one local backup exists.

- **Values:** one of the existing local backups, or none
