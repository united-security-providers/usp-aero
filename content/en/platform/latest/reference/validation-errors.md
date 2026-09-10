---
title: "Configuration validation errors"
weight: 80
draft: true
---

# Configuration validation errors

Each of these codes is reported by per-component configuration validation (see
[Configuration lifecycle](../concepts/configuration-lifecycle)) and blocks deployment until resolved.

### HOST_AT_LEAST_TWO_CONFIGURED_INTERFACES_REQUIRED {#HOST_AT_LEAST_TWO_CONFIGURED_INTERFACES_REQUIRED}

At least two network interfaces need to be configured.

### HOST_HA_UNAVAILABLE_FOR_DHCP {#HOST_HA_UNAVAILABLE_FOR_DHCP}

High Availability configuration could be enabled for static IP addresses of Management or Internal
network interface only.

### HOST_NON_EXISTING_CONFIGURED_INTERFACE {#HOST_NON_EXISTING_CONFIGURED_INTERFACE}

Configured network interface `{{arg0}}` does not exist.

### HOST_SYSTEM_HOSTNAME_NOT_IN_HA_CONFIG {#HOST_SYSTEM_HOSTNAME_NOT_IN_HA_CONFIG}

First cluster node in High Availability settings must reference System hostname.

### HOST_SYSTEM_IP_NOT_IN_HA_CONFIG {#HOST_SYSTEM_IP_NOT_IN_HA_CONFIG}

First cluster node in High Availability settings must reference static IP address of Management or
Internal network interface.

### INCOMPATIBLE_COMPONENT_VERSION {#INCOMPATIBLE_COMPONENT_VERSION}

Configuration was created for a different `{{arg0}}` component version `{{arg1}}` and is not
compatible with the installed version. The component's version update is required.

### WAAP_EXTERNAL_IFACE_NOT_CONFIGURED {#WAAP_EXTERNAL_IFACE_NOT_CONFIGURED}

External interface is not configured in system network configuration.

### WAAP_MISSING_LISTENER_IP {#WAAP_MISSING_LISTENER_IP}

`{{arg0}}` address of `{{arg2}}` listener is not specified in system network configuration.
