---
title: "System"
weight: 10
---

# System

The core settings of the system, such as its hostname, its label and the system time.

## System settings

### Hostname {#hostname}

The hostname of this system.

- **Values:** [hostname](../../value-types#hostname)
- **Required:** yes

### System Label {#label}

A freely defined text label for this system, helpful to differentiate it from other systems.

- **Values:** free text, at most 30 characters

### Color Schema {#colorSchema}

A color theme for the UI. It makes it easier to tell systems of different environments or roles
apart, for example "Default" for test systems and "Orange" for production systems.

- **Values:** `Default`, `Orange` or `Red`
- **Default:** `Default`

### Location {#location}

A freely defined text string that describes the physical location of the server.

- **Values:** free text, at most 50 characters

### Contact {#contact}

A freely defined text string that names the administrative contact for this system. It may be a
name or an email address.

- **Values:** free text, at most 50 characters

## System Time

Configure the time-server settings here to ensure that the server always runs with the correct time
and date.

On a follower of an [HA cluster](high-availability), *Timezone* and *NTP Server* are read-only. They are
taken from the leader.

### Timezone {#timezone}

Select the geographical timezone of the location of this server.

- **Values:** one of the timezones offered by the system
- **Required:** yes

### NTP Server {#ntpServers}

The NTP servers the system clock is synchronized with. Add an IP address or a DNS hostname. IPv6
addresses are only accepted when IPv6 support is enabled. Several servers are queried for the
current time in the configured order.

- **Values:** [hostname or IP address](../../value-types#host). Up to 3 servers, each unique
