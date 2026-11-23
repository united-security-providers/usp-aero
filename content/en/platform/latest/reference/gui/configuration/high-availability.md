---
title: "High Availability"
weight: 30
---

# High Availability

These screens appear only on an HA-capable deployment. They allow to enable a cluster setup that
provides high availability of the configured services between multiple server instances. High
availability requires a static IP address on the Management network interface; it cannot be enabled while
that interface obtains its address via DHCP.

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
is always the static IP address of the Management network interface, shown as `<interface> - <IP address>`:
cluster communication is fixed to the Management network interface.

The "SSH Public Key" is pre-generated when the system is set up and can be copied into the clipboard
with the copy icon, in order to configure it on the other cluster nodes.

A cluster has at most 10 nodes, including this one. Use the add and delete icons next to a row to add or remove
nodes.

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
