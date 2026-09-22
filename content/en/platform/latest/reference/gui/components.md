---
title: "Components"
weight: 40
---

# Components

This screen lists the software components installed on this appliance, their current version, and
whether an update is available.

## Toolbar

### Reload inventory {#onFetchInventory}

Reloads the list of installed components and available versions from the component inventory.

### Add Component {#onAddComponent}

Deploys a new component onto this appliance. Opens the "Add component" dialog, that shows a list
of available, additional components, if any.

## Component list

### Name {#componentName}

The display name of the component:

- **Aero Management**: the Aero Platform Management UI itself.
- **WAAP**: USP Aero WAAP - the Envoy-based Web Application and API Protection suite.

### Version {#componentVersion}

The version of the component currently installed.

### Status {#status}

Whether an update is available for the component. A row is highlighted when an update is available.

- **Values:** `Up to date`, `<version> available` (where `<version>` is the available update's
  version)

### Update component {#onUpdateComponent}

Updates a component to the latest available version. Disabled when no update is available, or while
another component operation is in progress.

### Rollback component update {#onRollbackComponent}

Reverts a component to the version it had before its last update. Only shown for components for which
rollback information is available.

### Remove {#onDeleteComponent}

Removes the component from the appliance. Only shown for components the backend reports as removable.

