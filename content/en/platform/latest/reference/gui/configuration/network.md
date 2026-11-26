---
title: "Network"
weight: 20
---

# Network

The USP Aero Platform is by-design multi-homed. At least the "Management" interface must be configured
and typically at least one more.

## Interface Roles Tabs

Each interface role has its own tab.

**Management** is the interface through which the administration UI is accessed.

**Internal** is used in architectures that separate management access from access to internal
backend systems. This interface may use a DHCP-assigned address, and it may also be left unassigned
("disabled").

**External** is the interface through which external clients access the offered services.

This role may hold more than one IP address (see [IP Address](#ipAddresses) below).

If WAAP component is installed, this role is required!

On a follower of an [HA cluster](high-availability), the "External" interface is read-only. The cluster shares it,
so change it on the leader.

## Interface Configuration

Each interface will show its MAC address and the connection state. The fields below apply to
whichever interface tab is open above; the Internal interface additionally offers a choice between a
static and a DHCP-assigned address.

### Interface {#name}

The physical network interface assigned to this role. Selecting an interface here makes it usable
for the settings below; the interface is otherwise left unassigned ("disabled").

- **Values:** one of the interface names detected on this system
- **Required:** yes

### IP Address {#ipType}

Whether this interface gets its address(es) statically configured below, or obtained automatically
via DHCP. DHCP is only offered on the Internal interface. The Management and External interfaces are
always statically configured.

- **Values:** `Static` or `DHCP`
- **Required:** yes - once the interface is assigned

### IPv4 {#ipv4Enabled}

Turns the static IPv4 configuration of this interface on or off. Only shown when IPv6 support is
enabled. Otherwise IPv4 is always configured. At least one IP version must be on.

- **Values:** `on` or `off`

### IPv6 {#ipv6Enabled}

Turns the static IPv6 configuration of this interface on or off. Only shown when IPv6 support is
enabled.

- **Values:** `on` or `off`

### IP Address {#ipAddresses}

Use the "Add IP Address" button to add an IP address for the system. The IP address must be
configured in CIDR notation, e.g. "10.99.3.10/24". Remove any configured IP address by clicking the
trash-can icon on its side. Only the External interface accepts more than one address per IP version.

- **Values:** [network in CIDR notation](../../value-types#cidr), matching the IP version of the
  section it is entered in (IPv4 or IPv6). Each address must be unique across all interfaces.
- **Required:** yes (at least one address once IPv4 or IPv6 if enabled)

### Primary {#primaryIpAddressIdx}

Marks which of an interface's IP addresses is the primary one. Only shown when more than one address
is allowed (the External interface).

- **Values:** one of the configured IP addresses for that interface
- **Default:** the first address, until another one is selected

### Gateway {#gateway}

Configure the IP address of the default gateway here.

- **Values:** [IP address](../../value-types#ip-address), matching the IP version of the section
  (IPv4 or IPv6).

### Don't use as default route {#dontUseGatewayAsDefaultRoute}

The gateway entered above is not installed as the system's default route.

- **Values:** `on` or `off`
- **Default:** `off`

### DNS Server {#dnsServers}

The DNS servers used for name resolution. At least one DNS server must be configured if hostnames
are used in the configuration of this system. This also applies to the DNS servers used
to override those obtained via DHCP (see [Ignore DNS obtained via DHCP](#ignoreDhcpDns)).

- **Values:** [hostname or IP address](../../value-types#host), matching the IP version of the
  section (IPv4, IPv6, or either, for DHCP). Up to 3 servers, each unique.

### DNS Search Query {#dnsSearchQueries}

Optional search queries for DNS resolution. This also applies to the search queries used to override
those obtained via DHCP.

- **Values:** free text (a DNS suffix) without a particular format. Each entry must be unique

### Routes {#routes}

Custom network routes. This also applies to the routes used to override those obtained via DHCP. See
[Ignore Routes obtained via DHCP](#ignoreDhcpRoutes).

Each route has a network and a next hop.

### Network {#networkCidr}

- **Values:** [network in CIDR notation](../../value-types#cidr), matching the IP version of the
  section. Each network must be unique among this interface's routes.
- **Required:** yes

### Next Hop {#nextHopIpAddress}

- **Values:** [IP address](../../value-types#ip-address), matching the IP version of the section
- **Required:** yes

### DHCP Client ID {#dhcpClientId}

The client identifier this interface sends with its DHCP requests.

- **Values:** free text without a particular format

### Ignore DNS obtained via DHCP {#ignoreDhcpDns}

Overrides the DNS servers and search queries offered by DHCP with the ones configured under
[DNS Server](#dnsServers) and [DNS Search Query](#dnsSearchQueries) above.

- **Values:** `on` or `off`
- **Default:** `off`

### Ignore Routes obtained via DHCP {#ignoreDhcpRoutes}

Overrides the routes offered by DHCP with the ones configured under [Routes](#routes) above.

- **Values:** `on` or `off`
- **Default:** `off`

## Tab "Manual Host entries"

Custom entries for the local hosts configuration file. Enter the IP address of the host and its DNS
name.

### IP Address {#ipAddress}

The address of the host entry. IPv6 addresses are only accepted when IPv6 support is enabled.

- **Values:** [IP address](../../value-types#ip-address)
- **Required:** yes

### Hostnames {#hostnames}

The name(s) that resolve to the IP address above.

- **Values:** one or more [hostnames](../../value-types#hostname), separated by commas
- **Required:** yes
