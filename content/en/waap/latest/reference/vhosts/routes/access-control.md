---
title: "Access Control"
weight: 50
---

# Access Control

The Access Control tab lets you restrict which IP addresses or CIDR ranges can reach this route.
Rules are enforced at the Envoy Gateway level via a `SecurityPolicy`, before traffic reaches your
backend. Each route can have its own independent policy.

## Enable / Disable

Use the **IP Access Control** toggle to turn the feature on or off. When disabled, all traffic
passes through unrestricted. Disabling the toggle also clears the access mode and any rules you have
entered.

## Access Mode

Defines the default action for traffic that does not match any rule.

- **Allow only listed IPs** — All traffic is blocked by default. Only IPs matching a rule are let
  through. Use this when you want to explicitly whitelist a known set of addresses.
- **Block listed IPs** — All traffic is allowed by default. Only IPs matching a rule are rejected.
  Use this when you want to block a specific set of addresses while keeping the route open to
  everyone else.

*Note: Using "Allow only listed IPs" with an empty rules table will block all traffic to this
route.*

## Rules

Each rule defines an IP address or range to match against incoming requests. Rules have three
fields: **Type** (`ip` for a single address, `cidr` for a range such as `10.0.0.0/8`), **Value** (the
address or range — single IPs are automatically expanded to `/32` or `/128`), and **Label** (a short
name used as the rule identifier in the generated policy). Add rules with the **+** button in the
rules table. All fields are required.
