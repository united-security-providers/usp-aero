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

Whether the backup data produced by this job includes the private key files.

- **Values:** `Full (incl. Keys)`, `Full (no Keys)`

### Edit {#edit}

Opens this job for editing.

### Delete {#delete}

Deletes this backup job.

### Trigger Backup job now {#triggerRun}

Runs this backup job immediately, without waiting for its schedule.

### Check connection {#checkConnection}

Verifies that the job's target host can be reached and authenticated against with the target's
configured settings. Only available for jobs with a remote target.

## Add Backup Job

When adding a new backup job, specify the following:

### Name {#name}

The name (label) for this backup job.

- **Values:** free text
- **Required:** yes

### Target {#targetId}

Specifies where to store the backup data — see [Backup targets](backup-targets) for how a target is
configured. Click the "+" icon to add a new target, the pencil icon to edit the selected one, or the
key icon to show its SSH public key (see [Backup Host Public Key](backup-targets#sshPublicKey)); the
key icon only appears once a remote target is selected.

- **Values:** `Local`, or the name of a configured [backup target](backup-targets)
- **Default:** `Local`

### Schedule (cron) {#scheduleCron}

Defines the scheduling for this backup job in common cron syntax.

- **Values:** [cron expression](../../value-types#cron)
- **Required:** yes

### Type {#type}

Defines if the backup data should contain all the private key files or not.

- **Values:** `Full (incl. Keys)`, `Full (no Keys)`
- **Default:** `Full (incl. Keys)`
- **Required:** yes
