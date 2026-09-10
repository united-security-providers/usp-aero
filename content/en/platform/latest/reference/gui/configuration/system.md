---
title: "System"
weight: 10
---

# System

The core system settings that are required to provide everything the platform needs for running
various services on top, such as networking, monitoring, backup etc.

## System settings

### Hostname {#hostname}

The hostname of this system.

- **Values:** [hostname](../../value-types#hostname)
- **Required:** yes

### System Label {#label}

A freely defined text label for this system, helpful to differentiate it from other systems.

- **Values:** free text, at most 30 characters

### Color Schema {#colorSchema}

A color theme for the UI. This allows to more easily differentiate between systems from different
environments, or with different roles (e.g. "Default" scheme for test environments and "Orange" for
production systems etc.).

- **Values:** `Default`, `Orange`, `Red`
- **Default:** `Default`
- **Required:** yes

### Location {#location}

A freely defined text string that describes the physical location of the server.

- **Values:** free text, at most 50 characters
- **Required:** no

### Contact {#contact}

A freely defined text string that names the administrative contact for this system (may be either
just a name, or an email address).

- **Values:** free text, at most 50 characters
- **Required:** no

## System Time

Configure the time-server settings here to ensure that the server always runs with the correct time
and date.

### Timezone {#timezone}

Select the geographical timezone of the location of this server.

- **Values:** one of the timezones offered by the system
- **Required:** yes

### NTP Server {#ntpServers}

You may add one or multiple NTP servers that will be used to synchronize the system clock with. Add
either a valid IPv4 or IPv6 address or a DNS hostname. Multiple time-servers can be added; they will
be queried for the current time in the configured order.

- **Values:** [hostname or IP address](../../value-types#host). Up to 3 servers; each must be unique
