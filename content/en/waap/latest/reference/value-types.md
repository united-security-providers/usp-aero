---
title: "Value types"
weight: 60
---

# Value types

Recurring value formats used by the settings in this reference.

## Duration {#duration}

A sequence of up to four amounts, each with its unit, in descending order: hours, minutes, seconds,
milliseconds. Each amount takes at most five digits.

Examples: `30s`, `1m30s`, `2h`, `500ms`, `1h30m0s`.

## Quantity {#quantity}

A number with an optional unit suffix. Binary suffixes are `Ki`, `Mi`, `Gi`, `Ti`, `Pi` and `Ei`
(multiples of 1024); decimal suffixes are `k`, `M`, `G`, `T`, `P` and `E` (multiples of 1000). Without
a suffix the number is a plain byte count.

Examples: `32Ki` (32768 bytes), `1Mi`, `65536`, `10M`.

## Hostname {#hostname}

A host name or fully qualified domain name of at most 253 characters, written as labels separated by
dots. Each label may contain letters, digits and hyphens, and may not begin or end with a hyphen.

Examples: `app-01`, `shop.example.com`.

## IP address {#ip-address}

An IPv4 address in dotted-decimal notation, or an IPv6 address.

Examples: `192.168.10.5`, `2001:db8::1`.

## Network in CIDR notation {#cidr}

A network address followed by a prefix length: `/1` to `/32` for IPv4, `/1` to `/128` for IPv6. The
default routes `0.0.0.0/0` and `::/0` are accepted as well.

Examples: `10.0.0.0/8`, `192.168.10.0/24`, `2001:db8::/32`.

## Port {#port}

A TCP port number from `1` to `65535`.

