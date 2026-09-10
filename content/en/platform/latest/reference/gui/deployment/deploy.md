---
title: "Deploying a configuration"
weight: 10
---

# Deploying a configuration

This screen allows to deploy the configuration for the core system and / or any of the registered
services (e.g. "WAAP"). See [Configuration lifecycle](../../concepts/configuration-lifecycle) for how this
fits into the overall flow of editing, revising and deploying a configuration.

Each registered component has its own tab, for example "System" for the base platform and "WAAP".
The same behavior and usage applies on every tab; it only concerns the changes in the
configuration of that particular component.

### Button "Review changes"

This opens a separate view which shows the differences in the current configuration settings compared
to the last revision.

### Button "Create Revision"

Click the "Create Revision" button to save the current changes into a new revision in the
configuration storage. This new revision can then be activated by deploying it.

### Button "Deploy Configuration"

Activates the latest or the selected configuration revision, restarting the corresponding services if
necessary. While a deployment is running its status is shown as in progress; it completes as either
successful or failed. A revision that has validation errors cannot be deployed — see
[Configuration validation errors](../validation-errors).
