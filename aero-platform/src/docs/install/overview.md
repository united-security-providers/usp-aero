# Installation

The USP Aero platform installation is a multi-stage process following these basic steps:

1. Base OS installation

    This first step entails installing a customized Fedora CoreOS system from an ISO image downloaded through the USP 
    Service Platform. It provides the infrastructure to run containers and basic network communication for downloading 
    container images.

2. Bootstraping the USP Base image

    After initial base OS installation the USP base image will be downloaded and activated, providing the actual Aero 
    platform base (including a console menu and the management UI web application). This step may happen fully 
    automatically if DNS and DHCP are available during the installation, and the USP container registry can be
    reached. If some of these conditions are not given, it may be necessary to configure the basic network
    connectivity and container registry information manually through the console menu as a prerequisite to
    successfully finish the bootstrapping process.

3. First-time Setup Wizard

    After the initial installation of the Aero base image has been completed, a setup wizard 
    web application will be started for the first-time configuration of the system. It allows
    to perform initial networking configuration, configuring root access credentials etc.
