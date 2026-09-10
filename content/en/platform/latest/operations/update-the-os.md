---
title: "Update Aero OS"
weight: 20
---

# Update the Aero base OS

The appliance runs on a base operating system image that is updated as a whole. Updating happens in
two steps: the appliance downloads and prepares the new image while it keeps running, and a reboot
then switches to it.

Plan the reboot - the appliance does not serve traffic and the GUI is
unavailable while it restarts.

> [!TIP]
> Take a configuration backup first, as with any maintenance on the appliance: see 
> [Set up automated backups](backup/automated-backups) or create a single backup from
> [Local backups and restore](../reference/gui/backup/local-backups-and-restore).

## Download and prepare the update

1. Open [Operating System](../reference/gui/system-management/operating-system). It shows the system details 
   and optional its location, the current release, and the latest release when a newer one is available. When
   the appliance is on the newest release, it says "Up to date" and offers no update.
2. Choose "Download & prepare OS update" and confirm.
3. Wait for the operation to finish. It runs on the appliance and takes a while; the screen reports
   its progress and the appliance stays fully in service throughout.

## Apply the update

4. When the screen reports that the update is ready to be applied, choose "Reboot System" and
   confirm.
5. Wait for the appliance to come back and sign in again.
6. Open [Operating System](../reference/gui/system-management/operating-system) again and confirm
   that the current release is the new one.

Until the reboot happens, the appliance keeps running the old image and the screen keeps reminding
you that an update is pending. Nothing is lost by postponing the reboot to a maintenance window.

## Reverting OS Update

If for any reason the upgrade causes problem, rollback to the previous version is possible. For this,
reboot the system and while the GRUB boot menu is shown select the previous entry.
