---
title: "High Availability"
weight: 30
---

# High Availability

These screens appear only on an HA-capable deployment. They allow to enable a cluster setup that
provides high availability of the configured services between multiple server instances.

### Shared Secret

Press the key icon to generate a secure shared secret. This same string value must be configured on
all cluster nodes.

## Cluster Nodes

The first cluster node in this view is always this server itself. Its "Hostname" and "IP Address"
values depend on the configuration defined in the [System](system) and [Network](network) screens.

The "SSH Public Key" is pre-generated when the system is set up and can be copied into the clipboard
here, in order to configure it on the other cluster nodes.

For the other nodes, the following values must be configured:

### Hostname

The DNS hostname of the participating cluster node.

### IP Address

The IPv4 or IPv6 address of the participating cluster node.

### SSH Public Key

The SSH public key of the participating cluster node.

## Mode

Defines the high availability mode to be used by this cluster:

- ACTIVE/PASSIVE: Only one node is active at any given time, the other(s) are on standby and will
  either take over automatically if the current active node goes offline, or if a take-over is
  triggered manually.
- ACTIVE/ACTIVE: All nodes are active at all times, and usually this means that traffic will be
  distributed between them.

Once a cluster is running, its operational status (which node is leader, whether nodes are in sync,
deployment status) is shown on [High Availability status](../system-management/high-availability).
