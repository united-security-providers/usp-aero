---
title: "Adding and Removing Cluster Nodes"
weight: 20
---

# Adding and Removing Cluster Nodes

This guide explains how to add a node to a running High Availability (HA) cluster, and how to remove a node from it
again, either to keep it as a standalone Aero instance or to decommission it.

## How cluster membership works

Every node has its own list of cluster nodes in *Configuration > High Availability*.

When you activate a Deployment the configuration is compared against the nodes cluster setup and is adjusted if needed:

- a node that is in the configuration but not in the cluster is **added**,
- a node that is in the cluster but no longer in the configuration is **removed**.

Changing the participating nodes on the **leader** will adjust the cluster configuration and remove cluster members,
this includes revoking cluster node authentication tokens created during setup.

Changing the participating nodes on a **follower** will adjust that nodes authentication tokens with these members.

> [!IMPORTANT]
> Make sure all cluster nodes use the same list of nodes participating in the cluster!

The HA settings, including the list of cluster nodes, belong to each node and are **not** distributed by a
[configuration synchronization](config-synchronization). Whenever the membership changes, update the list on
**every** node that stays in the cluster.

The *High Availability* page (*System Management > High Availability*) shows which node is the leader.

## Adding a node

> [!NOTE]
> The leader does not limit how many nodes join in one activation. Adding one node at a time is still
> recommended, so that you can confirm each node has joined before you add the next.

### Before you start

- **Prepare the new node.** It must be set up with the [First time wizard](../../install/firsttimewizard.md), and it
  must run the same platform version as the cluster nodes. A synchronization installs and updates feature components,
  but never the platform itself.
- **Use static addresses.** HA cannot be enabled on a node whose interfaces get their address via DHCP.
- **Check the network.** The new node must be in the same management network as the cluster nodes, and all nodes
  must reach each other on `TCP/2224`, `TCP/3121`, `TCP/21064`, `TCP/22` and `UDP/5405` (see
  [Set up an HA Cluster](set-up-an-ha-cluster)).
- **Bring every cluster node online.** Before the new node joins, it checks every node in its list. If it cannot
  reach one of them, it cannot tell whether a cluster already exists, and its activation fails rather than risk
  creating a second cluster.
- **Stay within the limit.** A cluster has at most 10 nodes.

> [!IMPORTANT]
> Cluster communication always uses the management network interface. Enter each node's **management** IP address
> in the list of cluster nodes.

### Steps

1. **On the new node**, open [Configuration > High Availability](../../reference/gui/configuration/high-availability):
    1. Switch on **Enabled**.
    2. Enter the cluster's **Shared Secret**. Copy it from one of the cluster nodes. Do **not** generate a new one.
    3. Select the same **Mode** as the cluster. (Currently only active/passive is supported.)
    4. Add one entry per existing cluster node with its hostname, management IP address and SSH public key. You can
       copy each node's SSH public key from its own *High Availability* page.
    5. Save, then [create a revision and activate it](../../concepts/configuration-lifecycle).

   The new node finds the running cluster and prepares itself to join. It does **not** create a cluster of its own.
2. **On the existing leader**, add an entry for the new node (hostname, management IP address and the SSH public key copied
   from the new node), save, and activate the new revision. The leader adds the new node to the cluster.
3. **On every other existing follower**, add the same entry for the new node, save and activate the new revision.
4. **Check the result** on the leader's
   [High Availability status](../../reference/gui/system-management/high-availability) page: the new node is listed
   in *Node Status* and is `online`. While it joins, it can briefly show `pending`.
5. **Synchronize.** On the leader, start a [synchronization](config-synchronization). The new node installs the
   feature components that run on the leader and receives the leader's configuration, including the cluster-shared
   external interface. Until then, it runs only its own initial configuration.

The order of steps 1 and 2 is a recommendation. If you activate on the leader first, the leader waits up to 15
minutes for the new node to become ready. If the new node is still not ready after that, the leader skips it and
adds it at the next activation on the leader.

## Removing a node

> [!WARNING]
> Remove/Replace nodes **one node at a time**.
>
> The leader removes at most one node per activation. If the node list on the leader would remove
> more than one node, the leader refuses the change and removes none. This protects the cluster against a
> configuration that arrived only partly or in a truncated form, which would otherwise look like a request to remove
> several nodes at once.

How you remove a node depends on whether it should keep running as a standalone Aero instance:

| You want to                                                   | Follow                                                               |
|---------------------------------------------------------------|----------------------------------------------------------------------|
| Keep the node and run it standalone                           | [Remove a node and keep it standalone](#remove-a-node-and-keep-it-standalone) |
| Decommission a node that is already shut down or unreachable  | [Remove a node that is no longer available](#remove-a-node-that-is-no-longer-available) |
| Dissolve the whole cluster                                    | [Dissolving a HA Cluster](uncluster)                                 |

> [!NOTE]
> If the cluster has only two nodes, removing one of them leaves a cluster with a single member. To end up with
> standalone nodes, [dissolve the cluster](uncluster) instead.

### Remove a node and keep it standalone

#### Before you start

- **The node must not be the leader.** Disabling HA on the leader dissolves the **whole** cluster. If the node you
  want to remove is the leader, first make another node the leader: sign in to that node and use **Take Over** on
  its *High Availability* page.
- **The node must be online, not in standby.** A node in standby cannot leave the cluster. Use **UnStandby** on that
  node first.
- **Plan a new external IP address for the node.** As on any follower that leaves a cluster, the node gives up the
  cluster's external IP addresses, and it needs its own external IP address before it can serve traffic again.

#### Steps

1. **Let the node leave the cluster.** Sign in to the management UI **of the node you want to remove**, open
   *Configuration > High Availability*, switch off **Enabled**, click **Save** and confirm the dialog.

   The dialog closes right away. In the background, the node removes its HA settings and the address configuration of
   its external interface, saves the result as a new `UNCLUSTER` revision and leaves the cluster. Only this node is
   affected: the leader and the other followers stay in the cluster. On the leader's *High Availability* page, the
   node now shows as `offline`.
2. **Remove the node on the leader.** Sign in to the leader, delete the node's entry from the list of cluster nodes,
   save, and activate the new revision. The leader removes the node from the cluster.
3. **Remove the node on every other follower** in the same way: delete its entry, save, and activate the new revision.
4. **Give the removed node a new external IP address.** Its `UNCLUSTER` revision is incomplete ("dirty") and was not
   activated. Configure its external interface and activate it, as described in
   [Bringing a follower back online](uncluster#bringing-a-follower-back-online).

Do steps 1 and 2 in this order. If you remove the entry on the leader first, the leader takes the node out of the
cluster while the node's own configuration still has HA enabled.

### Remove a node that is no longer available

Use this procedure for a node that has already been shut down, has failed for good, or cannot be reached anymore.

1. **On the leader**, delete the node's entry from the list of cluster nodes, save, and activate the new revision. The
   leader removes the node from the cluster even though it cannot reach it.
2. **On every other follower**, delete the same entry, save, and activate the new revision.
3. **Check the result** on the leader's *High Availability* page: the node is no longer listed in *Node Status*.

If the removed node is ever switched on again, it still has its old cluster configuration. Reinstall it as it holds
outdated / wrong cluster configuration settings.

## If something goes wrong

- **The new node does not appear, or stays `offline`:** check that the new node's activation succeeded, that the
  shared secret and the SSH public keys match, and that the ports listed above are open between all nodes. Then
  activate again on the leader. Each activation on the leader retries adding nodes that are not part of the cluster
  yet.
- **The activation on the new node fails right away:** one of the nodes in its list could not be reached. Bring all
  cluster nodes online and activate again.
- **The activation on the leader fails with a message that too many nodes would be removed:** the leader's list is
  missing more than one node of the running cluster. Check the list. If you really want to remove several nodes,
  remove them one after another, activating once per node.
- **The node you disabled HA on is still part of the cluster:** it was in standby at that moment. Use **UnStandby** on
  it, then switch off **Enabled** on it again.
