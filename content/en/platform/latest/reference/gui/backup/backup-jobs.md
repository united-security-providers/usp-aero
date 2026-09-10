---
title: "Backup jobs"
weight: 10
---

# Backup jobs

In the "Automated Backups" section, backups can be configured to be performed automatically at
certain times and dates. Click the "+" icon to add a new backup job.

## Add Backup Job

When adding a new backup job, the following fields must be filled in:

### Name

The name (label) for this backup job.

### Target

Specifies where to store the backup data — see [Backup targets](backup-targets) for how a target is
configured. Click the "+" icon there to add more storage targets.

### Schedule (cron)

Defines the scheduling for this backup job in common cron syntax.

### Type

Defines if the backup data should contain all the private key files or not.

## Managing backup jobs

From the backup jobs list you can trigger a backup job to run immediately, check the connection to
its target, or open the [Local Backups](local-backups-and-restore) list produced by it.
