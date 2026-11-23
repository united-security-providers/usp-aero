---
title: "Release Notes"
weight: 10
---

# Aero Platform Release Notes

<!--
## x.x.x - 202x-xx-xx

### Contents

- Fedora Core OS: 44.202xxxxx.3.1
- Aero Management Core Host UI: x.x.x
- Ansible CLI runner: x.x.x
- Ansible Playbooks: x.x.x

### New features and improvements

*

### Bug fixes

*

### Incompatible behavior changes

*

### Removed config or runtime

*

### Known Issues

*
-->

## 1.1.0 - 2026-11-20

### Contents

- Fedora Core OS: 44.20261023.3.1
- Aero Management Core Host UI: 1.1.4
- Ansible CLI runner: 1.0.3
- Ansible Playbooks: 1.1.0

### New features and improvements

* High Availability (Active/Passive) is now available:
  * New [High Availability status](reference/gui/system-management/high-availability) page with node, leader,
    synchronization and deployment status, and the actions Standby/UnStandby, Take Over, Restart Config Leader
    Resource and Synchronize.
  * New HA indicator in the top bar, with a badge showing how many areas of the cluster need attention.
  * [Configuration synchronization](operations/ha/config-synchronization) from the leader to the followers, including
    installing, updating and removing feature components on the followers.
  * [Nodes can be added to and removed](operations/ha/add-remove-nodes) from a running cluster (up to 10 nodes).
  * A cluster can be [dissolved](operations/ha/uncluster) by disabling HA on the leader. A single follower leaves the
    cluster by disabling HA on that follower.
  * Cluster communication is fixed to the Management network interface.
* Rebooting and shutting down the system from the GUI shows a status page. After a reboot, the page reloads
  automatically once the appliance is reachable again.
* The *Deployment* page lists the validation errors of a revision that cannot be deployed.
* The built-in help pages were replaced by a Help button that opens this online manual at the page for the current
  screen.
* Console menu: changing the password of user `core` asks for the current password first, and the proxy
  configuration accepts a bypass list.
* Live Log: new *Deployment Run* view showing the output of the last deployment run.
* Updated container images, among them Dozzle `v11.4.1` and Fluent Bit `5.1.5`. The identity provider (Dex) uses the
  patched image `2.46.1-usp.1` to avoid a refresh-token issue.

### Bug fixes

* Fixed renaming of certificates.
* Removing the WAAP component now also stops and removes its runtime.
* Blocked the kernel modules `ah6`, `pppoe` and `sctp`/`sctp_diag` (CVE-2026-80844, CVE-2026-68121, CVE-2026-74469).

### Incompatible behavior changes

* The backup type `Full (no Keys)` is no longer offered, because such backups still contained the private keys.
* The run log of a console-triggered deployment moved to `/var/log/aero-ansible/run.log`.

### Known Issues

* Backup always includes private keys.

## 1.0.0 - 2026-09-01

### Contents

- Fedora Core OS: 44.20260802.3.1
- Aero Management Core Host UI: 1.0.1
- Ansible CLI runner: 1.0.2
- Ansible Playbooks: 1.0.0

This is the first **official** release!

### New features and improvements

* New LiveLog view to check logs from UI
* Added Log forwarding option to send all logs to a SIEM or central log server in Syslog or OpenTelemetry format.

### Bug fixes

* Fixed OS update process
* Fixed display of component version.
* Fixed component installation, showing modular switch without reload
* ACME certificate rollout ensures that there is always a intermediate certificate available.
* Fixed reboot and shutdown triggers
* Fixed network configuration validation
* Fixed and improved various error handlers
* Removed stale development views

### Known Issues

* It's not possible to update to this version from previous releases. Systems must be reinstalled from scratch!
* High Availability Active/Passive is not functional yet
* Backup always includes private keys.


## 0.5.0 - 2026-06-03

### Contents

- Fedora Core OS: 44.20260419.3.1
- Aero Management Core Host UI: 0.5.0
- Ansible CLI runner: 1.0.2
- Ansible Playbooks: 0.5.0

This is the first unofficial release allowing to get familiar with how the platform works.

### New features and improvements

* Allow to configure System Settings like Hostname, network interfaces, container registry, ...
* Adding additional Feature components like Aero WAAP
* Configuration version management and deployment mechanism
* Local User management
* Backup and restore

### Known Issues

* OS Update does not work yet
* Component Version are not shown correctly
* UI triggered restart and shutdown is not working
* High Availability Active/Passive is not functional yet

