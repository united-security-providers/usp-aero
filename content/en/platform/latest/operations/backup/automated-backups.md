---
title: "Set up automated backups"
weight: 10
---

# Set up automated backups

A backup job creates an archive of this appliance's configuration on a schedule. Each job either
keeps its archives on the appliance or uploads them to a backup server over SCP or SFTP. Several
jobs can run side by side - for example an hourly local job for quick rollbacks and a nightly job to
a remote server for disaster recovery.

Backup jobs are part of the appliance configuration, so a new or changed job starts running only
after you deploy it.

## Add a backup target

Skip this section for a job that keeps its archives on the appliance.

1. Open [Automated Backups](../../reference/gui/backup/backup-jobs) and choose "Add Backup Target".
2. Give the target a name, and enter the host, port, username and the directory the archives are
   written to. Choose `SCP` or `SFTP` according to what the backup server offers. See
   [Backup targets](../../reference/gui/backup/backup-targets) for the individual fields.
3. Save the target.

The appliance authenticates with an SSH key pair that it generates itself; no password for the
backup server is ever stored on the appliance. Install its public key on the backup server:

4. Choose "Show SSH Public Key" on the target and copy the key.
5. On the backup server, append it to the `authorized_keys` file of the user you entered in step 2,
   and make sure that user may write to the target directory.
6. Back on the appliance, choose "Check connection" to confirm that the login and the directory
   work. Fix the target or the backup server until this succeeds - a job against an unreachable
   target simply fails at its scheduled time.

## Add the backup job

1. On [Automated Backups](../../reference/gui/backup/backup-jobs), choose "Add Backup job".
2. Enter a name.
3. Choose the target. `Local` keeps the archives on the appliance; otherwise pick one of the backup
   targets you configured.
4. Enter the schedule as a [cron expression](../../reference/value-types#cron). While you type, the
   screen shows what the expression means in plain language - check that line before saving. For a
   nightly backup at 02:00, use `0 2 * * *`.
5. Choose the type and save the job.
6. [Create a revision and deploy it](../../concepts/configuration-lifecycle). The job begins running
   within a minute of the deployment.

## Verify the job

Do not wait for the first scheduled run to find out whether the job works.

1. Choose "Trigger Backup job now" on the job. The appliance reports success or the reason for
   failure straight away.
2. For a local job, open the local backups list from "Show Local Backups list" and confirm the new
   entry with its creation date, type and file size.
3. For a remote job, confirm on the backup server that the archive arrived in the target directory.

## How many archives are kept

A local job's archives go into the appliance's local backup store, which keeps the **10 most recent
archives** and deletes older ones as new archives arrive.

A job with a remote target uploads each archive and keeps no local copy. Nothing is ever deleted on
the backup server, so retention there - and the backups of the backup server itself - is yours to
arrange.

## Related

- [Restore from backup](restore-from-backup) - putting an archive back
- [Automated Backups](../../reference/gui/backup/backup-jobs) - the fields of a job
- [Local backups and restore](../../reference/gui/backup/local-backups-and-restore) - the local
  archive list, and creating a single backup by hand
