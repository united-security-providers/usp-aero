---
title: "High Availability"
weight: 30
---

# High Availability

These screens appear only on an HA-capable deployment. They enable a cluster setup that provides high
availability of the configured services between multiple server instances. High availability requires
a static IP address on the Management network interface. It cannot be enabled while that interface
obtains its address via DHCP.

### Enabled {#enabled}

Turns the cluster setup on or off for this system.

- **Values:** `on` or `off`
- **Default:** `off`

Switching it off and saving asks for confirmation, because uncommitted platform configuration changes on this node
are discarded. What happens next depends on the node:

- **Leader:** the whole cluster is dissolved. The GUI opens the *Deployment* page, where you can follow the
  progress. See [Dissolving a HA Cluster](../../../operations/ha/uncluster).
- **Follower:** only this node leaves the cluster. A dialog reminds you to define a new external interface before
  the node runs standalone, then the GUI opens the *Deployment* page. See
  [Adding and Removing Cluster Nodes](../../../operations/ha/add-remove-nodes).
- **No cluster formed yet:** if HA was only saved but never deployed, the HA settings are simply removed.

### Shared Secret {#sharedSecret}

Press the key icon to generate a secure shared secret. This same string value must be configured on
all cluster nodes. Use the copy icon to copy it to the clipboard, and the eye icon to show or hide it.

- **Values:** free text, at most 32 characters
- **Default:** none
- **Required:** yes

## Cluster Nodes

The first cluster node in this view is always this server itself and cannot be removed. Its "Hostname" and
"IP Address" values are read-only and come from the [System](system) and [Network](network) screens. The IP address
is always the static IP address of the Management network interface, shown as `<interface> - <IP address>`.
Cluster communication is fixed to the Management network interface.

The "SSH Public Key" is pre-generated when the system is set up and can be copied into the clipboard
with the copy icon, in order to configure it on the other cluster nodes.

A cluster has at most 10 nodes, including this one. Use the add and delete icons next to a row to add or remove
nodes.

For the other nodes, the following values must be configured.

### Hostname {#hostname}

The DNS hostname of the participating cluster node.

- **Values:** [hostname](../../value-types#hostname)
- **Default:** none
- **Required:** yes

### IP Address {#ipAddress}

The IP address of the participating cluster node. IPv6 addresses are only accepted when IPv6 support
is enabled.

- **Values:** [IP address](../../value-types#ip-address)
- **Default:** none
- **Required:** yes

### SSH Public Key {#sshPublicKey}

The SSH public key of the participating cluster node.

- **Values:** free text (the public key value) without format validation
- **Default:** none
- **Required:** yes

### Mode {#mode}

Defines the high availability mode used by this cluster.

- **Active/Passive** - Only one node is active at any given time. The others are on standby. One of
  them takes over automatically when the active node goes offline, or when a takeover is triggered
  manually.
- **Active/Active** - All nodes are active at all times, and traffic is usually distributed between
  them.

- **Values:** `Active/Passive` or `Active/Active` (currently disabled in the GUI and cannot be selected)
- **Default:** `Active/Passive`
- **Required:** yes

Once a cluster is running, its operational status (which node is leader, whether nodes are in sync,
deployment status) is shown on [High Availability status](../system-management/high-availability).
