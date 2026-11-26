---
title: "Deploying a configuration"
weight: 10
---

# Deploying a configuration

This screen deploys the configuration of the core system and of the registered services, such as
"WAAP". See [Configuration lifecycle](../../../concepts/configuration-lifecycle) for how this
fits into the overall flow of editing, revising and deploying a configuration.

Each registered component has its own tab, for example "System" for the base platform and "WAAP".
Every tab works the same way and only concerns the configuration of its component.

A tab is marked when its component needs attention. It is red if the component has unreviewed changes or
its revision has validation errors, and yellow if a revision is ready to deploy.

## Toolbar

### Synchronize {#synchronize}

Starts a configuration synchronization from this node to the other nodes of the HA cluster. Only shown on the
leader of an HA cluster. See [Synchronizing Configuration in a HA Cluster](../../../operations/ha/config-synchronization).

## Configuration Deployment

Each component's tab shows one of a few states, depending on whether it has unreviewed changes, a
revision ready to deploy, or a deployment in progress or finished.

### Review changes {#reviewChanges}

This opens the [configuration revision](revisions) screen, which shows the differences in the
current configuration settings compared to the last revision.

### Deploy Configuration {#deployConfiguration}

Shown once a revision is ready to be activated. It takes you to the Deploy screen below, where it
(and any other pending revisions) can be selected for deployment. A **Deploy** button with the same
effect also appears in the page's toolbar whenever any component has a revision ready to deploy.

If the revision has validation errors it cannot be deployed. Instead of the button, the tab shows the message
"Configuration revision N has validation errors and cannot be deployed" and lists the errors below it. See
[Validation errors](../../validation-errors) for their meaning.

## Deploy {#deploy-screen}

Choose which components' configuration revisions should be deployed, then deploy them.

Each row can be selected with a checkbox once its revision has no validation errors and has not
already been activated. The **Deploy** button below is disabled until at least one row is selected.
A row whose revision has validation errors shows the status *Has validation errors*, and the errors are listed
above the table.

### Component {#componentName}

The name of the component.

### Revision {#revision}

The revision number available for activation.

### Message {#comment}

The [message](revisions#message) that was entered when the revision was created.

### Status {#status}

The deployment status of the component's selected revision.

### Deploy {#deploy}

Activates the configuration revisions selected in the table above, restarting the corresponding
services if necessary. While a deployment is running, its status is shown as in progress. It
completes as either successful or failed. A revision that has validation errors cannot be deployed.
