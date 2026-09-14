---
title: "Set up an HA cluster"
weight: 20
---

# Set up an HA cluster

> [!NOTICE]
> This feature is planned to be available from version 1.1 onwards.

## Requirements

In order to operate an Aero cluster the following requirements are in effect:

- At minimum two nodes configured by [First time wizard](../../install/firsttimewizard.md) ready to use
- Management Network configured within the same network
- All nodes being able to connect to each other using `TCP/2224`, `TCP/3121`, `TCP/21064`, `TCP/22` and `UDP/5405`

## Cluster creation

1. On the node that will be the first cluster member, open
   [High Availability](../../reference/gui/configuration/high-availability) and press the key icon to generate a
   `Shared Secret`.
2. Copy that same `Shared Secret` to every other node(s) that will join the cluster.
3. For each additional node, add a cluster node entry with its Hostname, IP Address and SSH Public
   Key (copy from the other node UI).
4. Choose the cluster Mode, `ACTIVE/PASSIVE` or `ACTIVE/ACTIVE` depending on feature availability.
5. [Create a revision and deploy it](../../concepts/configuration-lifecycle) to apply the cluster
   configuration.
6. Once the cluster is running, check its state on
   [High Availability status](../../reference/gui/system-management/high-availability).

## Cluster initialization process

Having configure a set of nodes to form a cluster, creating the revision and deploy the change then the following process will initiate:

1. The node using the lowest octet-IP from management interface will act as `setup-coordinator` which is in charge for form the cluster
1. Every other node configures the cluster configuration during the deployment run
1. Once all members are pre-configured (deployment run finished) which the `setup-coordinator` waits for (timing out after 5min) cluster creation will be finished and status can be observed via [High Availability status](../../reference/gui/system-management/high-availability) screen

> [!IMPORTANT]
> The `setup-coordinator` node will wait for other nodes to complete the successful deployment. After 5min it aborts the deployment run indicating
> a deployment failure. Make sure all other nodes have run their deployment too and re-initiate the deployment run on the `setup-coordinator` (node having the lowest last Octet IP within Management network)
