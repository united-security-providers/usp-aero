# Installation

The USP Aero platform installation is a multi-stage process following these basic steps:

1. Base OS installation

    This first phase installs a Fedora CoreOS system with the infrastructure to run containers 
    and provides basic network communication for downloading container images etc.

2. USP Base image activation

    After initial base OS installation the USP base image will be downloaded and activated, providing
    the actual Aero platform base (including the management UI).

3. First-time Setup Wizard

    After the initial installation of the Aero base image has been completed, a setup wizard 
    web application will be started for the first-time configuration of the system. It will allow
    to perform initial networking configuration, configuring root access credentials etc.

## Download ISO image

The first requisite for installing the USP Aero platform is to download the ISO installer image
from the USP service portal.

*MORE DETAILS TBD*

## Hardware requirements

The recommended minimum hardware requirements for running the USP Aero platform are as follows:

* 8 GB RAM
* 40 GB disk space
* 8 CPU cores

# Setup Procedure

## With DHCP / DNS

If the Aero system is set up in an environment with access to DHCP and DNS services, the setup will be very
straightforward:

* Insert the custom USP FCOS ISO image into the DVD drive and boot the system with it
* After the initial Fedora CoreOS installation, the system will automatically download the USP base platform 
  from the USP registry (on "uspregistry.azurecr.io") and install it.
* After a reboot, the first-time setup wizard UI will become available on all network interfaces. 

## Without DHCP / DNS

If DNS and DHCP are not available in the installation environment, the system will not be able to automatically
download the USP base platform image after the initial FCOS installation. In this case, it is necessary to
manualle configure the network settings through the console menu, and manually trigger the bootstrapping
of the USP base platform:

* Insert the custom USP FCOS ISO image into the DVD drive and boot the system with it
* After the initial Fedora CoreOS installation, the console menu will be shown after a failed attempt to
  download the USP Aero base platform.
* Configure the network interfaces in the console menu:

### Networking configuration

* In the console menu type "S":
* Edit a connection
* Select the correct connection according to the Mac Adresse e.g. Wired connection 1
* IPv4 CONFIGURATION <Manual> → "Show"
* Addresses <Add...> → <static-ip>
* Gateway: <default-gateway>
* DNS servers: <nameserver> incl. search-domains
* IPv6 CONFIGURATION <Disabled>
* OK
* Trigger the bootstrapping of the USP Aero base platform by pressing "B"
* After a successful bootstrapping, the first-time setup wizard UI will become available on all configured interfaces.

Once done, open a web browser to access the first-time setup wizard
