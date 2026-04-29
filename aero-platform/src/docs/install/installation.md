# Setup Procedure

## With DHCP / DNS

If the Aero system is set up in an environment with access to DHCP and DNS services, the setup will be very
straightforward:

* Insert the DVD with the custom USP FCOS ISO image into the DVD drive and boot the system with it

![Console window during boot / setup](../assets/images-console/screenshot_aero_console1.png)
 
* After the initial Fedora CoreOS installation, the system will automatically download the USP base platform 
  from the USP registry (on "uspregistry.azurecr.io") and install it.

![Console window boot complete](../assets/images-console/screenshot_aero_console2.png)

* After a reboot, the [first-time setup wizard](firsttimewizard.md) UI will become available on all network interfaces. 

## Accessing the GUI / First Time Setup Wizard

The IP address where the UI is available after initial installation will be shown in the console window:

![Console window boot complete](../assets/images-console/screenshot_aero_console3.png)

## Without DHCP / DNS

If DNS and DHCP are not available in the installation environment, the system will not be able to automatically
download the USP base platform image after the initial FCOS installation. In this case, it is necessary to
manualle configure the network settings through the console menu, and manually trigger the bootstrapping
of the USP base platform:

* Insert the custom USP FCOS ISO image into the DVD drive and boot the system with it
* After the initial Fedora CoreOS installation, the console menu will be shown after a failed attempt to
  download the USP Aero base platform.

Afterwards, configure the network interfaces in the [console menu](console.md).

