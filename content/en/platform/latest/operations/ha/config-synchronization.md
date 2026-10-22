---
title: "Synchronizing Configuration in a HA Cluster"
weight: 30
---

# Synchronizing Configuration in a HA Cluster

This guide explains how to synchronize the configuration from the leader node to the other nodes of a High Availability (HA)
cluster, and what happens on each node while that runs.

## Before you start

An HA cluster has three kinds of nodes:

| Role         | Meaning                                                                                       |
|--------------|-----------------------------------------------------------------------------------------------|
| **Leader**   | The node where you change and activate the configuration. There is exactly one leader.        |
| **Follower** | Any other online node. Followers receive the leader's configuration when you synchronize.     |
| **Standby**  | A node you have put into standby. It does not take part in synchronization.                   |

The **High Availability** page (*System Management > High Availability*) shows which node is the leader.

Synchronization is **never automatic**. Activating a configuration on the leader changes only the leader. The followers
keep running their previous configuration until you synchronize them. This is deliberate: you can upgrade or
reconfigure one node and still fall back to an unchanged follower (with **Take Over**) if something goes wrong.

## You can only synchronize from the leader

You can only start a synchronization on the leader node, because the leader is the source of the configuration. On a
follower or standby node, the synchronize buttons are hidden. If a request comes from a node that is not the leader,
the appliance rejects it.

If you need to start a synchronization from a different node, make that node the leader first with **Take Over** on
the *High Availability* page.

## How to start a synchronization

1. Sign in to the management UI **of the leader node**.
2. Activate the configuration you want to distribute. Only the **active** configuration of each component is
   synchronized. Drafts and revisions that are not yet activated stay on the leader.
3. Start the synchronization in one of these places:
    - *Deployment* page: **Synchronize HA**
    - *System Management > High Availability*, in the *Sync Status* section: **Trigger Sync** (asks you to confirm)
4. Watch the progress on the *High Availability* page (see [Monitoring the result](#monitoring-the-result)).

The button returns right away. The synchronization keeps running in the background and can take several minutes,
especially if components have to be installed or updated on the followers.

## What happens during a synchronization

| Step | Leader                          | Follower(s)                                              |
|------|---------------------------------|----------------------------------------------------------|
| 1    | Check for changes               |                                                          |
| 2    | Export the active configuration |                                                          |
| 3    | Signal the followers            |                                                          |
| 4    |                                 | Copy the configuration from the leader                   |
| 5    |                                 | Install, update or remove components to match the leader |
| 6    |                                 | Import the configuration as new revisions                |
| 7    |                                 | Activate the new revisions                               |
| 8    |                                 | Report the result to the cluster                         |
| 9    | Shown as "synchronized"         |                                                          |

1. **Check for changes.** The leader checks whether any component's active configuration changed since the last
   synchronization. If nothing changed, it stops here and the followers are left alone.
2. **Export.** The leader exports the active configuration of every installed component, including the platform
   (host) configuration. It also records which version of each component is installed.
3. **Signal the followers.** The leader tells the cluster that new configuration is available.
4. **Copy.** Each follower copies the exported configuration from the leader over the cluster's internal, encrypted
   connection. Standby nodes skip this step and every step after it.
5. **Align the installed components.** Each follower compares its components with the leader's:
    - a component the leader has but the follower does not have is **installed**,
    - a component that is older on the follower than on the leader is **updated**,
    - a component that is installed on the follower but was removed from the leader is **removed**.

   These operations run one after another. The follower waits until each component is up and running before
   it continues.
6. **Import.** For each component, the follower stores the leader's configuration as a new revision. Components that
   already run the leader's configuration are skipped.
7. **Activate.** The follower activates the imported revisions, just as if you had activated them on that node
   yourself.
8. **Report.** The follower records the result (the configuration it now runs, and any error) where the whole cluster
   can see it.
9. **Done.** When a follower activates the configuration, the leader is shown as *synchronized*.

Each follower runs steps 4 to 8 on its own. A follower that fails does not affect the leader or the other followers.

## Revisions created on a follower

For each component whose configuration differs from the leader's, the synchronization creates **one new revision** on
the follower and **activates it immediately**.

- **Message.** Every imported revision gets the same comment, which names the leader and the configuration ID imported
  for each component, for example:

  ```
  Imported from HA sync configuration from node node1: aero-mgmt-core-host=12, feature-waap=7
  ```

  You can use this comment in the revision history to see when a follower was synchronized and what it received.
- **Unchanged components get no revision.** If a component already runs the leader's configuration, nothing is
  created for it.
- **Node-specific settings are kept.** Some platform settings belong to the individual node and are never taken from
  the leader. The follower keeps its own:
    - hostname, label, color scheme, location and contact,
    - network interfaces, except the *external* interface, which the cluster shares,
    - High Availability settings.
- **Unsaved work on the follower is discarded.** If someone left an open draft for a component on the follower, the
  synchronization deletes it. Always make configuration changes on the leader.
- **Earlier revisions remain.** The follower's older revisions stay in its history, but they are replaced as the
  active configuration.

## Component versions on followers

The leader's installed component versions are the target. Each follower handles its components as follows.

### The component is not installed on the follower

The follower **installs the component automatically**, using the version installed on the leader. It waits until the
new component has started and is ready, then imports and activates the leader's configuration for it.

This is the usual case when you add a new node to the cluster or install a new feature on the leader.

### The component on the follower is older than on the leader

The follower **updates the component automatically** to the leader's version. It waits for the update to finish and
the component to be ready, then imports and activates the leader's configuration.

### The component on the follower is newer than on the leader

The follower **keeps its newer version**. A synchronization never downgrades a component. The follower imports and
activates the leader's configuration on its newer version.

This usually happens during a rolling upgrade, where you upgrade a follower first and keep the leader on the old
version as a fallback. When you have finished upgrading, update the leader too, so that every node runs the same
versions again.

> [!NOTICE]
> The synchronization only installs, updates and removes **feature components**. It never changes the
> management platform (*core host*) itself. Upgrade the platform on each node separately.

### When a component cannot be installed or updated

If installing, updating or removing a component fails, or does not finish within the allowed time (10 minutes by
default), the synchronization of that follower stops. The follower keeps running its previous configuration, and the
error is reported (see below).

## Monitoring the result

On the leader, open *System Management > High Availability*:

- **Sync Status** lists the configuration IDs that each node currently runs, per component. Values that differ from
  the leader's are highlighted, and so is any component a node has not received yet.
- **Deployment Status** shows the progress of each node, for example *transfer started*, *component deploy started*,
  *import started*, *activation started* and finally *activated*. On the leader, it changes to *synchronized* when a
  follower has finished.
- If a follower fails, its status changes to *sync failed* and an error message explains the cause.

## Good to know

- **Synchronize after every change on the leader.** Until you do, the followers run the previous configuration. If a
  follower takes over before you synchronize, it serves the old configuration.
- **Standby nodes catch up on their own.** Nodes in standby are skipped. After **UnStandby**, the node first
  synchronizes from the current leader, using the configuration of the last synchronization. Changes you activated
  on the leader since then are not included until you synchronize again.
- **One operation at a time per node.** If another installation or activation is still running on a follower, the
  follower waits for it to finish before it continues.
- **Nothing changed, nothing done.** If the leader's configuration has not changed since the last synchronization,
  triggering it again has no effect.
