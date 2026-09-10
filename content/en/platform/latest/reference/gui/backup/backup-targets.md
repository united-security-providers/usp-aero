---
title: "Backup targets"
weight: 20
---

# Backup targets

A backup job stores its data at a target. Several kinds of target are available:

- **Local** - Stores the backup locally, as a downloadable local backup — see
  [Local backups and restore](local-backups-and-restore).
- **SCP** - Stores the backup on a remote system by use of Secure Copy (SCP).
- **SFTP** - Stores the backup on a remote system by use of Secure File Transfer (SFTP).

## Add Backup Target

For "SCP" and "SFTP", a number of settings must be specified:

### Name

The name (label) of the target host.

### Host

The hostname or IP address of the target host.

### Port

The listener port of the target host.

### Username

The account used to authenticate the connection to the target host.

### Target Directory Path

The directory path in the filesystem of the target host where to store the backup.

## SSH Public Key

Each target's SSH public key can be copied to the clipboard, so it can be added to the authorized
keys of the target host's account.

## Check connection

Verifies that the target host can be reached and authenticated against with the configured settings.
