---
title: "Network"
weight: 20
---

# Network

## Tab "Management"

Define which network interface has the "Management" role by selecting an interface from the
"Interface" drop-down list. The "Management" role is used for the interface through which the
administration UI should be accessed.

## Tab "Internal"

Define which network interface has the "Internal" role by selecting an interface from the
"Interface" drop-down list. The "Internal" role is used for the interface through which the WAAP WAF
will be able to access internal backend systems.

## Tab "External"

Define which network interface has the "External" role by selecting an interface from the
"Interface" drop-down list. The "External" role is used for the interface through which external
clients will access the virtual hosts of the WAAP WAF.

## Interface Configuration

Each interface will show its MAC address and the connection state.

### Switches "IPv4" / "IPv6"

Enable either one to enable IPv4 and / or IPv6 connectivity. The following fields will then need to
be configured.

### Button "Add IP Address"

Use this button to add an IP address for the system. The IP address must be configured in CIDR
notation, e.g. "10.99.3.10/24". Remove any configured IP address by clicking the trash-can icon on
its side.

### Gateway

Configure the IP address of the default gateway here.

### Button "Add DNS Server"

Add IP addresses for DNS servers used for name resolution. At least one DNS server MUST be configured
if hostnames are used in the configuration of this system.

### Button "Add DNS Search Query"

Allows to configure an optional search query for DNS resolution.

### Button "Add Route"

Allows to add custom network routes.

## Tab "Manual Host entries"

Allows to add custom entries for the local hosts configuration file. Enter the IP address of the host
and its DNS name.
