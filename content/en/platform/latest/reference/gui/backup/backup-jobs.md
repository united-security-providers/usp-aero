---
title: "Backup jobs"
weight: 10
---

# Backup jobs

In the "Automated Backups" section, backups can be configured to be performed automatically at
certain times and dates. Click the "+" icon to add a new backup job.

## Automated Backups

Lists every configured backup job.

### Name {#name-column}

The name (label) for this backup job.

### Target {#target}

Where this job stores its backup data: `Local`, or the name of a configured
[backup target](backup-targets).

### Schedule {#scheduleCron-column}

The job's schedule, shown as configured.

### Type {#type-column}

The content of the backup data produced by this job.

- **Values:** `Full (incl. Keys)`

### Edit {#edit}

Opens this job for editing.

### Delete {#delete}

Deletes this backup job.

### Trigger Backup job now {#triggerRun}

Runs this backup job immediately, without waiting for its schedule. It is offered in the row's menu.

### Check connection {#checkConnection}

Verifies that the job's target host can be reached and authenticated against with the target's
configured settings. Only available for jobs with a remote target.

## Add Backup Job

When adding a new backup job, specify the following.

### Name {#name}

The name (label) for this backup job.

- **Values:** free text
- **Required:** yes

### Target {#targetId}

Specifies where to store the backup data. See [Backup targets](backup-targets) for how a target is
configured. Click the "+" icon to add a new target, the pencil icon to edit the selected one, or the
key icon to show its SSH public key (see [Backup Host Public Key](backup-targets#sshPublicKey)). The
key icon only appears once a remote target is selected.

- **Values:** `Local`, or the name of a configured [backup target](backup-targets)
- **Default:** `Local`

### Schedule (cron) {#scheduleCron}

Defines the scheduling for this backup job in common cron syntax.

- **Values:** [cron expression](../../value-types#cron)
- **Default:** `0 0/1 * * *` (every hour)
- **Required:** yes

### Type {#type}

Defines the content of the backup data. It is always a full backup, which also contains all private
keys.

- **Values:** `Full (incl. Keys)`
- **Default:** `Full (incl. Keys)`

> [!NOTICE]
> Backups always contain the private keys. Store backup archives securely.
