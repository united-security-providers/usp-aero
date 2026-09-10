---
title: "Release Notes"
weight: 10
---

# Aero Platform Release Notes

## 1.0.0 - 2026-09-01

### Contents

- Fedora Core OS: 44.20260802.3.1
- Aero Management Core Host UI: 1.0.1
- Ansible CLI runner: 1.0.2
- Ansible Playbooks: 1.0.0

This is the first **official** release!

## New features and improvements

* New LiveLog view to check logs from UI
* Added Log forwarding option to send all logs to a SIEM or central log server in Syslog or OpenTelemetry format.

## Bug fixes

* Fixed OS update process
* Fixed display of component version.
* Fixed component installation, showing modular switch without reload
* ACME certificate rollout ensures that there is always a intermediate certificate available.
* Fixed reboot and shutdown triggers
* Fixed network configuration validation
* Fixed and improved various error handlers
* Removed stale development views

## Known Issues

* It's not possible to update to this version from previous releases. Systems must be reinstalled from scratch!
* High Availability Active/Passive is not functional yet


## 0.5.0 - 2026-06-03

### Contents

- Fedora Core OS: 44.20260419.3.1
- Aero Management Core Host UI: 0.5.0
- Ansible CLI runner: 1.0.2
- Ansible Playbooks: 0.5.0

This is the first unofficial release allowing to get familiar with how the platform works.


## New features and improvements

* Allow to configure System Settings like Hostname, network interfaces, container registry, ...
* Adding additional Feature components like Aero WAAP
* Configuration version management and deployment mechanism
* Local User management
* Backup and restore
<!---
## Bug fixes

* Lorem ipsum

## Incompatible behavior changes

* Lorem ipsum


## Removed config or runtime

* Lorem ipsum
-->
## Known Issues

* OS Update does not work yet
* Component Version are not shown correctly
* UI triggered restart and shutdown is not working
* High Availability Active/Passive is not functional yet

