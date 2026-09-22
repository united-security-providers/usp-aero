---
title: "Deploying a configuration"
weight: 10
---

# Deploying a configuration

This screen allows to deploy the configuration for the core system and / or any of the registered
services (e.g. "WAAP"). See [Configuration lifecycle](../../../concepts/configuration-lifecycle) for how this
fits into the overall flow of editing, revising and deploying a configuration.

Each registered component has its own tab, for example "System" for the base platform and "WAAP".
The same behavior and usage applies on every tab; it only concerns the changes in the
configuration of that particular component.

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

If the revision has validation errors it cannot be deployed, and no button is shown.

## Deploy {#deploy-screen}

Choose which components' configuration revisions should be deployed, then deploy them.

Each row can be selected with a checkbox once its revision has no validation errors and has not
already been activated; the **Deploy** button below is disabled until at least one row is selected.

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
services if necessary. While a deployment is running its status is shown as in progress; it
completes as either successful or failed. A revision that has validation errors cannot be deployed.
