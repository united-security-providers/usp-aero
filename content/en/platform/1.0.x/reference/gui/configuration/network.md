---
title: "Network"
weight: 20
---

# Network

The USP Aero Platform is by-design multi-homed. At least the "Management" interface must be configured
and typically at least one more.

## Interface Roles Tabs

### Management

The "Management" role is used for the interface through which the
administration UI should be accessed.

### Internal

The "Internal" role is used for architectures, which separates management access from access
internal backend systems.

This role allow to use DHCP assigned IP-address and may also be left unassigned ("disabled").

### External

The "External" role is used for the interface through which external clients will access
offered service.

This role may hold more than one IP address (see [IP Address](#ipAddresses) below).

If WAAP component is installed, this role is required!

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
via DHCP. DHCP is only offered on the Internal interface; the Management and External interfaces are always
statically configured.

- **Values:** `Static`, `DHCP`
- **Required:** yes - once the interface is assigned

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
- **Required:** no

### Don't use as default route {#dontUseGatewayAsDefaultRoute}

The gateway entered above is not installed as the system's default route.

- **Values:** `on` or `off`
- **Default:** `off`

### DNS Server {#dnsServers}

Add IP addresses for DNS servers used for name resolution. At least one DNS server MUST be configured
if hostnames are used in the configuration of this system. This also applies to the DNS servers used
to override those obtained via DHCP (see [Ignore DNS obtained via DHCP](#ignoreDhcpDns)).

- **Values:** [hostname or IP address](../../value-types#host), matching the IP version of the
  section (IPv4, IPv6, or either, for DHCP). Up to 3 servers; each must be unique.
- **Required:** no

### DNS Search Query {#dnsSearchQueries}

Allows to configure an optional search query for DNS resolution. This also applies to the search
queries used to override those obtained via DHCP.

- **Values:** free text (a DNS suffix); no particular format is enforced. Each entry must be unique
- **Required:** no

### Routes {#routes}

Allows to add custom network routes. This also applies to the routes used to override those obtained
via DHCP (see [Ignore Routes obtained via DHCP](#ignoreDhcpRoutes)).

Each route has a network and a next hop:

#### Network {#networkCidr}

- **Values:** [network in CIDR notation](../../value-types#cidr), matching the IP version of the
  section. Each network must be unique among this interface's routes.
- **Required:** yes

#### Next Hop {#nextHopIpAddress}

- **Values:** [IP address](../../value-types#ip-address), matching the IP version of the section
- **Required:** yes

### DHCP Client ID {#dhcpClientId}

The client identifier this interface sends with its DHCP requests.

- **Values:** free text; no format is enforced
- **Required:** no

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

Allows to add custom entries for the local hosts configuration file. Enter the IP address of the host
and its DNS name.

### IP Address {#ipAddress}

The address of the host entry.

- **Values:** [IP address](../../value-types#ip-address)
- **Required:** yes

### Hostnames {#hostnames}

The name(s) that resolve to the IP address above.

- **Values:** one or more [hostnames](../../value-types#hostname), separated by commas
- **Required:** yes
