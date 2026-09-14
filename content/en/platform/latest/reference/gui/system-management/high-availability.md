---
title: "High Availability status"
weight: 20
---

# High Availability status

> [!NOTICE]
> This feature is planned to be available from version 1.1 onwards.

This screen shows the operational status of an HA cluster set up on the
[High Availability](../configuration/high-availability) configuration screen. It is only available on
an HA-capable deployment.

At any time, one cluster node acts as the **leader** — the node allowed to change cluster-wide
configuration and the one deployments are triggered on — while the others are **followers**,
synchronizing configuration from the leader. A node can also be put into **standby**, in which case it
takes no part in cluster events.

## Node Status

Lists each cluster member with its current status: active, standby, or offline. A node can be put
into or brought out of standby from here.

### Member {#member}

The cluster member's hostname.

- **Values:** [hostname](../../value-types#hostname)

### Status {#nodeStatus}

The node's status as reported by the cluster.

- **Values:** `online`, `offline`, `standby`, `maintenance`, `pending`, `unclean`, `unknown`

### StandBy {#standby}

Puts the local node into standby. It stops running cluster resources, including the config-leader.
Only shown for the local node, and only while it is not already in standby.

### UnStandby {#unstandby}

Brings the local node back out of standby. Only shown for the local node while it is in standby.

## Leader Status

Shows whether the config-leader resource is currently active on a node, and allows restarting it —
which may briefly move leadership to another node.

### Status {#status}

Whether the config-leader resource is currently active on a cluster member.

- **Values:** `online`, `offline`

### Member {#leaderMember}

The cluster member the config-leader resource is currently active on, if any.

- **Values:** [hostname](../../value-types#hostname)

### Restart Config Leader Resource {#restartLeader}

Restarts the config-leader cluster resource. Cluster leadership may briefly move to another node
while it restarts. Only shown when the config-leader resource is currently active on the local node.

## Sync Status

Shows, per follower, whether its configuration matches the leader's, and allows manually triggering a
synchronization from the leader to the followers.

### Member {#syncMember}

The cluster member's hostname.

- **Values:** [hostname](../../value-types#hostname)

### Config ID {#syncConfigId}

A digest identifying the combined configuration this member last synchronized. Shown as `-` if the
member has not synchronized yet. Comparing this value across members shows whether a follower's
configuration matches the leader's.

### Trigger Sync {#triggerSync}

Triggers configuration synchronization from the leader to the followers. Only shown when the local
node is the leader.

## Deployment Status

Shows, per node, the outcome of the last configuration deployment.

### Member {#deploymentMember}

The cluster member's hostname.

- **Values:** [hostname](../../value-types#hostname)

### Status {#deploymentStatus}

The node's raw deployment/synchronization status, shown as `Unknown` if not yet set. This is an
internal attribute rather than a fixed set of GUI states; values seen in practice include `activated`,
`synchronized`, `sync_failed` and `transferred`.

## Status indicator

A summarized status indicator is shown in the top navigation bar at all times: green when every
factor above is healthy, yellow when HA is functional but something needs attention (for example a
node not yet synced, or in standby), and red when HA is limited or unavailable (for example a node
that cannot activate its configuration, or is offline).
