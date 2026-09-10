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
