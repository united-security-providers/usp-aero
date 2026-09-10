---
title: "Console menu"
weight: 30
---

# Console menu

The console menu runs on the appliance's local console - the physical screen and keyboard, or the
console of the virtual machine. It is what brings a freshly installed node far enough to be managed:
network settings, the container registry to fetch the platform from, and the bootstrap itself. It
stays available afterwards for status information, the proxy configuration and a controlled reboot.

![Console menu](../assets/images-console/screenshot_aero_console_menu.png)

Enter the letter of an option and press Enter - for example `B` then Enter to start bootstrapping.
`?` or `H` shows the built-in help.

## Menu options

### I - Show status information {#option-i}

Shows the release of the ignition file the system was provisioned with, followed by the status of
the atomic system trees. The tree list is the authoritative answer to "which base image is running
here, and which one would a rollback return to".

### N - Show network information {#option-n}

Lists the network configuration as the network management sees it:
interfaces, connection profiles, IP addresses and routing.

### S - Setup networking {#option-s}

Opens the NetworkManager text interface (`nmtui`), where the node's addressing is configured. The
node needs to reach the container registry before it can be bootstrapped, so this is normally the
first option used on a new node.

![Console network](../assets/images-console/screenshot_aero_console_network.png)

For a static address, choose "Edit a connection" and then the connection matching the MAC address of
the interface - for example "Wired connection 1" - and set:

* IPv4 CONFIGURATION `<Manual>` → "Show"
* Addresses `<Add...>` → `<static-ip>`
* Gateway: `<default-gateway>`
* DNS servers: `<nameserver>`, including the search domains
* IPv6 CONFIGURATION `<Disabled>`

### A - Add static host entries {#option-a}

Adds an IP address and hostname mapping to the system's hosts file, for names that no DNS server on
the network resolves - a container registry reachable only by name, for instance.

- **Values:** an IPv4 address and a name, separated by a space, e.g. `10.0.0.20 registry.example.com`
- Select the option again for each further entry.
- Enter `-` to remove every entry the console added. Entries are marked in the file, so mappings
  added by other means are left alone.
- Press Enter without input to return to the menu.

### C - Change password for user 'core' {#option-c}

Changes the password of the user `core`. The new password is asked for twice, the two entries must
match, and it is rejected if the system's complexity check fails.

### P - Define proxy server for internet access {#option-p}

Sets the proxy used for outbound access, in particular for fetching the base image.

- **Values:** `http://<user>:<password>@<host>:<port>`, where user, password and port are optional

```
http://proxy.example.com
http://proxy.example.com:1234
https://myuser:mypassword@proxy.example.com:1234
```

User name and password must be [percent-encoded](https://en.wikipedia.org/wiki/Percent-encoding).
As a consequence the user name cannot contain a `:` and the password cannot contain an `@`.

Press Enter to keep the current setting, or enter `-` to remove the proxy configuration again.

### E - Enter container registry details {#option-e}

Asks for everything needed to reach the registry that holds the platform image. The answers are
stored on the node and are used by "Show repository tags" and "Bootstrap container image".

| Prompt | Accepted values |
|---|---|
| Container registry | letters, digits, hyphens and periods, optionally followed by `:<port>`; a hyphen or period may not start or end the name or appear twice in a row; at most 255 characters |
| Does the registry use TLS? | `y` or `n` |
| Is the registry considered 'insecure'?  | `y` or `n`; asked only when TLS is used. "Insecure" tells the container runtime to accept the registry's TLS certificate without validating it, which is what a registry with a self-signed certificate needs.|
| Registry username | letters, digits and hyphens, not at the start or end and not twice in a row; at most 30 characters |
| User password | any characters including spaces, but not at the start or end; asked only when a user name was given |
| Container image name incl. namespace | letters, digits, hyphens, periods and forward slashes, none of them at the start or end or twice in a row; at most 255 characters |
| Repository tag | starts with a letter, digit or underscore, followed by letters, digits, periods, underscores or hyphens; at most 128 characters |

At every prompt, press Enter to keep the current value or enter `-` to fall back to the default.

### T - Show repository tags {#option-t}

Lists the tags the registry offers for the configured image, after printing the registry, user, TLS
and insecure settings it used. If registry and image are not set yet, it asks for them first.

This is the quickest check that the registry details and the network are right: if no tag list
appears, bootstrapping will not work either. The error output shows the HTTP status and the
registry's response.

### B - Bootstrap container image {#option-b}

Rebases the node onto the configured platform image and reboots when that has finished. Registry,
image and tag must be set; the image reference and the proxy in use are shown for confirmation
before anything happens.

After the reboot the node runs the USP Aero Platform, and the
[first-time setup wizard](../install/firsttimewizard) becomes available on the configured
interfaces.

### R - Reboot {#option-r}

Reboots the node after confirmation.
