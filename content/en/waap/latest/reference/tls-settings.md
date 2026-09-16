---
title: "TLS versions, ciphers and algorithms"
weight: 60
---

# TLS versions, ciphers and algorithms

This shared block of settings appears wherever a screen offers "Customize TLS Versions to use" or
"Customize supported Ciphers and Algorithms" — for example on a [backend](gui/backends/tls)'s or a
[listener](gui/listeners/tls)'s TLS tab. The fields themselves are documented once here; the screens that
embed them link back to this page.

## TLS Versions

Each TLS version has its own switch. At least one version is required, and the selected versions must
be sequential without gaps (for example 1.2 and 1.0 cannot be selected without 1.1).

Available version:
* 1.3
* 1.2
* 1.1
* 1.0

## Customize supported Ciphers and Algorithms

### Customize supported Ciphers and Algorithms {#customCiphersAndAlgorithmsEnabled}

Switches from the appliance's default cipher suites, ECDH curves and signature algorithms to a
custom selection.

- **Values:** `on` or `off`
- **Default:** `off`

In all three fields below, write one entry per line, and put the most preferred entry first - the
order of the lines is the order in which they are offered.

### Cipher Suites for TLS 1.2 and older {#cipherSuites}

The list of cipher suites allowed for TLS 1.2 and earlier connections, one entry per line. This field
is not shown when only TLS 1.3 is selected above, since TLS 1.3 uses its own fixed cipher suites.

- **Values:** one cipher suite per line, from the list below. Suites can be given equal rank by
  combining them in square brackets, separated by `|`, as in the default value: they then count as
  equally preferred and the client's own order decides between them.
- **Default:** when switched on, pre-filled with:
  ```
  [ECDHE-ECDSA-AES128-GCM-SHA256|ECDHE-ECDSA-CHACHA20-POLY1305]
  [ECDHE-RSA-AES128-GCM-SHA256|ECDHE-RSA-CHACHA20-POLY1305]
  ECDHE-ECDSA-AES256-GCM-SHA384
  ECDHE-RSA-AES256-GCM-SHA384
  ```

These cipher suites are supported:

```
ECDHE-ECDSA-AES128-GCM-SHA256    ECDHE-ECDSA-CHACHA20-POLY1305
ECDHE-RSA-AES128-GCM-SHA256      ECDHE-RSA-CHACHA20-POLY1305
ECDHE-ECDSA-AES256-GCM-SHA384    ECDHE-ECDSA-AES128-SHA
ECDHE-RSA-AES256-GCM-SHA384      ECDHE-RSA-AES128-SHA
AES128-GCM-SHA256                ECDHE-ECDSA-AES256-SHA
AES256-GCM-SHA384                ECDHE-RSA-AES256-SHA
AES128-SHA                       AES256-SHA
```

### ECDH curves {#ecdhCurves}

The list of ECDH curves allowed for the TLS connection, one entry per line. They are used for the key
exchange in both TLS 1.2 and TLS 1.3.

- **Values:** one curve per line, from the list below. Names are case-sensitive and must match
  exactly.
- **Default:** when switched on, pre-filled with:
  ```
  X25519MLKEM768
  X25519
  P-256
  ```

These curves are supported:

```
X25519MLKEM768
X25519Kyber768Draft00
MLKEM1024
X25519
P-256
P-384
P-521
```

The first two combine the classical X25519 with a post-quantum key exchange, which is what the
default starts with.

### Signature Algorithms {#signatureAlgorithms}

The list of signature algorithms allowed for the TLS connection, one entry per line. They apply to
both TLS 1.2 and TLS 1.3.

- **Values:** one algorithm per line, from the list below.
- **Default:** when switched on, pre-filled with:
  ```
  ecdsa_secp256r1_sha256
  rsa_pss_rsae_sha256
  rsa_pkcs1_sha256
  ecdsa_secp384r1_sha384
  rsa_pss_rsae_sha384
  rsa_pkcs1_sha384
  rsa_pss_rsae_sha512
  rsa_pkcs1_sha512
  rsa_pkcs1_sha1
  ```

These signature algorithms are supported:

```
ecdsa_secp256r1_sha256    rsa_pss_rsae_sha256    rsa_pkcs1_sha256
ecdsa_secp384r1_sha384    rsa_pss_rsae_sha384    rsa_pkcs1_sha384
ecdsa_secp521r1_sha512    rsa_pss_rsae_sha512    rsa_pkcs1_sha512
ecdsa_sha1                ed25519                rsa_pkcs1_sha1
rsa_pkcs1_sha256_legacy   rsa_pkcs1_md5_sha1
```

