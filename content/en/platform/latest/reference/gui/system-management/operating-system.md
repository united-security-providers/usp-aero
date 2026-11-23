---
title: "Operating System"
weight: 10
---

# Operating System

This screen manages all OS related settings.

### System: {#systemName}

The system's hostname, followed by its label and hardware type when they are set.

### Location: {#systemLocation}

The system's configured location.

### Current release: {#currentVersion}

The version of the USP Aero Base Image currently installed.

### Latest release: {#availableVersion}

The newest USP Aero Base Image release available for installation. Only shown when it is newer than the currently
installed version.

### Download & prepare OS update {#installOsUpdate}

Downloads the available USP Aero Base Image release and prepares it for installation. Only shown while a newer
release is available. Once preparation has finished, reboot the system (see below) to complete the
update.

### Reboot System {#systemReboot}

Reboots the entire Aero appliance. Required to finalize OS update.

After you confirm, the GUI shows a *System is rebooting* page. The page checks the appliance every few seconds and
reloads by itself once the appliance is reachable again. You may need to sign in again.

### Shutdown System {#systemShutdown}

Performs a controlled shutdown of the Aero appliance.

After you confirm, the GUI shows a *System is shutting down* page. The appliance is then no longer reachable and can
be powered off safely.

Both buttons are disabled while an infrastructure operation is in progress, and hidden in read-only mode.
