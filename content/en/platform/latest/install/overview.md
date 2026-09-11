---
title: "Installation"
weight: 10
---

# Installation

The USP Aero platform installation is a multi-step process following these basic steps.

## Aero Installer installation

The installer is copied to the disk from the ISO. It provides the required tools to download and setup the basic
network communication and container sources.

## Bootstrapping the USP Aero base OS

After initial installation the USP Aero base image will be downloaded and activated, providing the actual Aero
platform base (including a console menu and the management UI web application). This step may happen fully
automatically if DNS and DHCP are available during the installation and the USP container registry[^1] can be
reached. If some of these conditions are not given, it's necessary to configure the basic network
connectivity and container registry information manually through the [console menu](../reference/console) as a prerequisite to
successfully finish the bootstrapping process.

## First-time Setup Wizard

After the initial installation of the Aero base image has been completed, a setup wizard
is started for the [first-time configuration](./firsttimewizard.md) of the system. It allows to finalize networking configuration,
configuring admin access credentials etc.

[^1]: USP Container registry is available at `uspregistry.azurecr.io` using https.
