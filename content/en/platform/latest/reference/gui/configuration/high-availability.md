---
title: "High Availability"
weight: 30
---

# High Availability

> [!NOTICE]
> This feature is planned to be available from version 1.1 onwards.

These screens appear only on an HA-capable deployment. They allow to enable a cluster setup that
provides high availability of the configured services between multiple server instances. High
availability requires this system's interfaces to be statically addressed; it cannot be enabled while
any of them obtains its address via DHCP.

### Enabled {#enabled}

Turns the cluster setup on or off for this system.

- **Values:** `on` or `off`
- **Default:** `off`

### Shared Secret {#sharedSecret}

Press the key icon to generate a secure shared secret. This same string value must be configured on
all cluster nodes.

- **Values:** free text, at most 32 characters
- **Default:** none
- **Required:** yes

## Cluster Nodes

The first cluster node in this view is always this server itself. Its "Hostname" and "IP Address"
values depend on the configuration defined in the [System](system) and [Network](network) screens.

The "SSH Public Key" is pre-generated when the system is set up and can be copied into the clipboard
here, in order to configure it on the other cluster nodes.

For the other nodes, the following values must be configured:

### Hostname {#hostname}

The DNS hostname of the participating cluster node.

- **Values:** [hostname](../../value-types#hostname)
- **Default:** none
- **Required:** yes

### IP Address {#ipAddress}

The IPv4 or IPv6 address of the participating cluster node.

- **Values:** [IP address](../../value-types#ip-address)
- **Default:** none
- **Required:** yes

### SSH Public Key {#sshPublicKey}

The SSH public key of the participating cluster node.

- **Values:** free text (the public key value); no format is validated
- **Default:** none
- **Required:** yes

### Mode {#mode}

Defines the high availability mode to be used by this cluster:

- ACTIVE/PASSIVE: Only one node is active at any given time, the other(s) are on standby and will
  either take over automatically if the current active node goes offline, or if a take-over is
  triggered manually.
- ACTIVE/ACTIVE: All nodes are active at all times, and usually this means that traffic will be
  distributed between them.

- **Values:** `Active/Passive`, `Active/Active` (currently disabled in the GUI and cannot be selected)
- **Default:** `Active/Passive`
- **Required:** yes

Once a cluster is running, its operational status (which node is leader, whether nodes are in sync,
deployment status) is shown on [High Availability status](../system-management/high-availability).
