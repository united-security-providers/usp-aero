---
title: "Configuration lifecycle"
weight: 20
---

# Configuration lifecycle

> [!IMPORTANT]
> This is the single most important concept in the Aero Management GUI: **editing a setting only
> stores it as a draft change.** It does not take effect on its own. A setting becomes active only
> after it is saved into a configuration revision, and that revision is deployed.

## The lifecycle at a glance

1. You edit settings on any configuration screen and save. Nothing is applied yet.
2. Using the `Deployment` screen you **create a revision**, which freezes the current draft changes into a new, numbered revision
   in the configuration storage.
3. You **deploy** that revision, which activates it and restarts the affected services if necessary.
4. If a deployed revision turns out to be wrong, you can **roll it back** to an earlier one.

Each registered component — the core system and each installed feature such as WAAP — has its own
independent sequence of revisions and its own deployment. See
[Deploying a configuration](../reference/gui/deployment/deploy) for how the deployment screen is organized per
component.

## Creating a revision

Use **Create Revision** to save the current draft changes as a new configuration revision. See
[Configuration revisions](../reference/gui/deployment/revisions) for what a revision consists of.

## Resetting changes

Use **Reset Changes** to discard the current draft changes and return to the state of the last
revision, without creating a new one.

## Deploying a configuration

Use **Deploy Configuration** to activate a revision. Deployment status — in progress, successful or
failed — is shown while it runs; see [Deploying a configuration](../reference/gui/deployment/deploy) for details.
A revision that has validation errors cannot be deployed until the errors are resolved; see
[Configuration validation errors](../reference/validation-errors.md).

## Configuration history and rollback

Every revision that was ever created is kept in the configuration history, together with its author,
message and creation/deployment dates. From there, an earlier revision can be rolled back, which
deploys it again as a new revision. See
[History and rollback](../reference/gui/deployment/history-and-rollback).

## Configuration validation

Before a configuration can be deployed, the selected and active revisions are validated to ensure
the resulting configuration is functional and works together.

## High Availability

On an HA-capable deployment, a revision only needs to be deployed on the leader node; deployed
configuration is then synchronized to the other cluster nodes. See
[High Availability status](../reference/gui/system-management/high-availability).
