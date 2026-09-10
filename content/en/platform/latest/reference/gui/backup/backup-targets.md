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

### Name {#name}

The name (label) of the target host. If left blank, the target is shown by its host and port
instead.

- **Values:** free text

### Host {#host}

The hostname or IP address of the target host.

- **Values:** [hostname](../../value-types#hostname)
- **Required:** yes

### Port {#port}

The listener port of the target host.

- **Values:** [port](../../value-types#port)
- **Default:** `22`
- **Required:** yes

### Username {#username}

The account used to authenticate the connection to the target host.

- **Values:** free text
- **Required:** yes

### Target Directory Path {#targetDirectoryPath}

The directory path in the filesystem of the target host where to store the backup.

- **Values:** free text
- **Required:** yes

### Type {#type}

The protocol used to connect to the target host — see above for the difference between SCP and
SFTP.

- **Values:** `SCP`, `SFTP`
- **Default:** `SCP`
- **Required:** yes

Deleting a target (trash icon) is only possible while no backup job uses it.

## Backup Host Public Key

Opened from the key icon next to a remote target on the
[Add/Edit Backup Job](backup-jobs#targetId) screen.

### SSH Public Key {#sshPublicKey}

Each target's SSH public key can be copied to the clipboard, so it can be added to the authorized
keys of the target host's account.

- **Values:** read-only; generated automatically for the target
