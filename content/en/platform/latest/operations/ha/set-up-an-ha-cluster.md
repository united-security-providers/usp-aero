---
title: "Set up an HA cluster"
weight: 20
draft: true
---

# Set up an HA cluster

1. On the node that will be the first cluster member, open
   [High Availability](../../reference/gui/configuration/high-availability) and press the key icon to generate a
   Shared Secret.
2. Copy that same Shared Secret to every other node that will join the cluster.
3. For each additional node, add a cluster node entry with its Hostname, IP Address and SSH Public
   Key.
4. Choose the cluster Mode, ACTIVE/PASSIVE or ACTIVE/ACTIVE.
5. [Create a revision and deploy it](../../concepts/configuration-lifecycle) to apply the cluster
   configuration.
6. Once the cluster is running, check its state on
   [High Availability status](../../reference/gui/system-management/high-availability).
