---
title: "Value types"
weight: 70
---

# Value types

Recurring value formats used by the settings in this reference.

## Cron expression {#cron}

A schedule written as five fields separated by spaces:

```
minute  hour  day-of-month  month  day-of-week
```

| Field        | Range                        |
|--------------|------------------------------|
| minute       | `0`-`59`                     |
| hour         | `0`-`23`                     |
| day of month | `1`-`31`                     |
| month        | `1`-`12`                     |
| day of week  | `0`-`7` (`0` and `7` = Sunday) |

Every field takes `*` for "any value", a list (`1,15`), a range (`1-5`) and a step (`*/15`, `0/2`).

Examples:

| Expression      | Runs                                   |
|-----------------|----------------------------------------|
| `0 0/1 * * *`   | every hour, on the hour                |
| `0 2 * * *`     | every day at 02:00                     |
| `30 3 * * 0`    | every Sunday at 03:30                  |
| `0 4 1 * *`     | on the first day of every month at 04:00 |
| `*/15 * * * *`  | every 15 minutes                       |

Only the five-field form is accepted. Shorthands such as `@daily`, and six-field expressions that
start with a seconds field, are rejected when the configuration is saved. While you type, the GUI
shows the schedule in plain language underneath the field - a good check that the expression means
what you intended.

Times follow the system timezone, which is set under
[Configuration → System](gui/configuration/system#timezone).

## Hostname {#hostname}

A host name or fully qualified domain name of at most 253 characters, written as labels separated by
dots. Each label may contain letters, digits and hyphens, and may not begin or end with a hyphen.

Examples: `backup-01`, `backup.example.com`.

## IP address {#ip-address}

An IPv4 address in dotted-decimal notation, or an IPv6 address.

Examples: `192.168.10.5`, `2001:db8::1`.

## Hostname or IP address {#host}

Either a [hostname](#hostname) or an [IP address](#ip-address).

## Network in CIDR notation {#cidr}

A network address followed by a prefix length: `/1` to `/32` for IPv4, `/1` to `/128` for IPv6. The
default routes `0.0.0.0/0` and `::/0` are accepted as well.

Examples: `10.0.0.0/8`, `192.168.10.0/24`, `2001:db8::/32`.

## Port {#port}

A TCP or UDP port number from `1` to `65535`.
