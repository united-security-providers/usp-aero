---
title: "System"
weight: 10
---

# System

The core system settings that are required to provide everything the platform needs for running
various services on top, such as networking, monitoring, backup etc.

## System settings

### Hostname

The hostname of this system.

### System Label

A freely defined text label for this system, helpful to differentiate it from other systems.

### Color Schema

A color theme for the UI. This allows to more easily differentiate between systems from different
environments, or with different roles (e.g. "Default" scheme for production systems and "Orange" for
test environments etc.).

### Location

A freely defined text string that describes the physical location of the server.

### Contact

A freely defined text string that names the administrative contact for this system (may be either
just a name, or an email address).

## System Time

Configure the time server settings here to ensure that the server always runs with the correct time
and date.

### Timezone

Select the geographical timezone of the location of this server.

### NTP Server

You may add one or multiple NTP servers that will be used to synchronize the system clock with. Add
either a valid IPv4 or IPv6 address or a DNS hostname. Multiple time servers can be added; they will
be queried for the current time in the configured order.
