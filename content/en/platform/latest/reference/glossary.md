---
title: "Glossary"
weight: 100
---

# Glossary

### Component

A software component installed on the appliance, such as the core host itself ("System") or a
feature such as WAAP. See [Components](gui/components.md).

### Configuration revision

A saved, numbered snapshot of a component's configuration. See
[Configuration revisions](GUI/deployment/revisions).

### Deployment

The activation of a configuration revision. See [Deploying a configuration](GUI/deployment/deploy).

### HA

High Availability: a cluster setup providing continued operation across multiple server instances.
See [High Availability](GUI/configuration/high-availability).

### Leader

In an HA cluster, the node currently allowed to change cluster-wide configuration and on which
deployments are triggered.

### Follower

In an HA cluster, a node that synchronizes its configuration from the leader.

### Standby

A cluster node state in which the node takes no part in cluster events, such as taking over as
leader.
