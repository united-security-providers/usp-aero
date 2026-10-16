---
title: "Dissolving a HA Cluster"
weight: 40
---

# Dissolving a HA Cluster (Uncluster)

This guide explains how to dissolve a High Availability (HA) cluster so that every node runs as a standalone Aero
instance again, and what happens on each node while that runs.

## Before you start

- **Start on the leader node.** The uncluster is driven by the leader. The *High Availability* page
  (*System Management > High Availability*) shows which node is the leader.
- **Bring every node online and out of standby.** The leader tells the followers to leave the cluster. A node that is
  offline or in standby at that moment does not act on it and stays configured as a cluster member.
- **Finish or discard pending platform changes on all nodes.** The uncluster stores the platform configuration as a
  new revision. Unsaved draft changes to the platform configuration on a node become part of that revision.
- **Plan new external IP addresses for the followers.** After the uncluster, every follower needs its own external IP
  address before it can serve traffic again (see [On each follower](#on-each-follower)).
- **Expect a service interruption on the followers.** The leader keeps serving traffic. The followers do not, until
  you have reconfigured them.

## How to start the uncluster

1. Sign in to the management UI **of the leader node**.
2. Open *Configuration > High Availability*.
3. Switch off **Enabled**.
4. Click **Save** and confirm the *Disable High Availability* dialog.

The dialog closes right away. The uncluster keeps running in the background and can take several minutes. You can
follow its progress in the infrastructure operation status, as you would for any other activation.

## What happens during an uncluster

| Step | Leader                                                                                 | Follower(s)                                                                             |
|------|----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| 1    | Signal the followers to leave                                                          |                                                                                         |
| 2    | New revision without HA settings (external IPs kept)                                   |                                                                                         |
| 3    | Leave the cluster, keep the virtual external IPs as own IPs / revision becomes active  |                                                                                         |
| 4    |                                                                                        | Pick up the signal                                                                      |
| 5    |                                                                                        | New revision without HA settings and without external IPs                               |
| 6    |                                                                                        | Leave the cluster, release the virtual external IPs > revision stays inactive ("dirty") |

1. **Signal the followers.** Before it changes anything on itself, the leader tells all followers through the cluster
   that the cluster is being dissolved.
2. **Create a new revision on the leader.** The leader removes the HA settings from its platform configuration and
   saves the result as a new revision with the comment `UNCLUSTER`.
3. **Leader leaves the cluster.** The leader stops the cluster services and removes its cluster membership. Then it
   activates the new revision. It keeps the virtual external IP addresses (see below).
4. **Followers pick up the signal.** Each follower notices the signal on its own, usually within a few seconds.
5. **Create a new revision on each follower.** Each follower removes the HA settings **and** the address
   configuration of its external network interface, then saves the result as a new `UNCLUSTER` revision.
6. **Followers leave the cluster.** Each follower stops its cluster services, removes its cluster membership and
   releases the virtual external IP addresses. Its new revision is **not** activated (see below).

Each node removes only itself from the cluster. The leader and each follower carry out their own part independently.

## New revisions on the leader and the followers

Every node that takes part in the uncluster gets **one new revision** of its platform configuration with the comment
`UNCLUSTER`. You find it in the platform configuration's revision history.

|                         | Leader                               | Follower                                         |
|-------------------------|--------------------------------------|--------------------------------------------------|
| HA settings             | removed                              | removed                                          |
| External interface      | unchanged                            | address configuration removed                    |
| Revision state          | **active**                           | **not active**: incomplete ("dirty")             |
| Node serves traffic     | yes, on the former virtual IPs       | no, until you assign a new external IP           |

Feature component configurations (for example WAAP) are not changed on any node.

## On the leader: it takes over the virtual external IPs

While the cluster was running, the external IP addresses were **virtual IPs**. The cluster managed them and moved
them to whichever node was active.

When the cluster is dissolved, the leader **keeps these addresses as its own, fixed IP addresses**. The services
running on the leader continue without interruption, so clients still reach the same addresses as before.

From now on, the leader is a standalone Aero instance. Its new revision is complete and active, and you configure it
as you would any standalone node.

## On each follower

### Why the follower's configuration becomes "dirty"

A follower must not keep the virtual external IPs: the leader now owns them, and the same address on two machines
causes an IP conflict. The follower therefore **releases the virtual IPs and removes the address configuration of
its external network interface**.

The new `UNCLUSTER` revision reflects this, so it is **incomplete**. An Aero instance needs a valid external
interface, and this revision does not have one. It would fail validation, so it is **not activated**. Such a revision
is called *dirty*: it describes the actual state of the node, but it is not a valid configuration you can activate.

Until you fix this, the follower:

- is no longer part of a cluster,
- has no external IP address and does not serve traffic,
- can still be reached through its management interface, which is not affected by the uncluster.

### Bringing a follower back online

1. Sign in to the management UI **of the follower** through its management IP address.
2. Open *Configuration > Network* and configure the external network interface with a **new IP address** that is not
   used anywhere else (in particular, not one of the former virtual IPs that the leader now holds).
3. Save, then activate the new revision of the platform configuration on the *Deployment* page.

After the activation succeeds, the follower runs as a standalone Aero instance with its own external IP address.

## If something goes wrong

- **A step fails or times out on a node** (the default limit is 10 minutes): the `UNCLUSTER` revision has already
  been created, but the node may still be partly configured as a cluster member. There is no automatic rollback.
  Contact support to complete the uncluster on that node.
- **A node was offline or in standby during the uncluster:** that node did not leave the cluster and still holds its
  old cluster configuration. It cannot follow the signal later on its own. Contact support to remove it from the
  cluster manually.
