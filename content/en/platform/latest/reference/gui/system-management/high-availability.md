---
title: "High Availability status"
weight: 20
---

# High Availability status

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

## Leader Status

Shows whether the config-leader resource is currently active on a node, and allows restarting it —
which may briefly move leadership to another node.

## Sync Status

Shows, per follower, whether its configuration matches the leader's, and allows manually triggering a
synchronization from the leader to the followers.

## Deployment Status

Shows, per node, the outcome of the last configuration deployment.

## Status indicator

A summarized status indicator is shown in the top navigation bar at all times: green when every
factor above is healthy, yellow when HA is functional but something needs attention (for example a
node not yet synced, or in standby), and red when HA is limited or unavailable (for example a node
that cannot activate its configuration, or is offline).
