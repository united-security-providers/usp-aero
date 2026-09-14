---
title: "Log"
weight: 60
---

# Log

Should the [logs be forwarded](../../../operations/logging/remote-log) to a central log server such as a SIEM, it can be configured here.
Logs are always available on the appliance itself through [Live Log](../../../operations/logging/live-log).

## Remote Log

A switch that turns log forwarding on and off. While it is off, no logs leave the appliance and the
remaining settings are hidden.

- **Values:** `on` or `off`
- **Default:** `off`

### Hostname {#hostname}

The log server logs are forwarded to.

- **Values:** [hostname](../../value-types#hostname)
- **Required:** yes

### Port {#port}

The port the log server listens on.

- **Values:** [port](../../value-types#port)
- **Required:** yes

### Log protocol {#logProtocol}

The protocol used to send the log data. Choose the one your log server expects.

- **Values:** `Syslog`, `OpenTelemetry`
- **Default:** `Syslog`
- **Required:** yes

## TLS

A switch that encrypts the connection to the log server. Leave it on unless the log server does not
support TLS; without it, log data crosses the network in the clear.

- **Values:** `on` or `off`
- **Default:** `off`

### Disable Server Certificate validation {#disableServerCertificateValidation}

Accepts the log server's certificate without checking it. This removes the protection TLS gives you
against a forged or misdirected endpoint, so use it only while testing.

- **Values:** `on` or `off`
- **Default:** `off`

### Trusted CA Certificate {#trustedCaCertificateId}

The CA certificate the log server's certificate is validated against. The list offers the CA
certificates uploaded under [Certificates](certificates); `-` means none is selected. Only shown
while server certificate validation is enabled.

- **Values:** one of the configured CA certificates

### Client Certificate (mTLS) {#clientCertificateId}

The certificate this appliance presents to the log server, for a server that requires mutual TLS.
The list offers the certificates configured under [Certificates](certificates); `-` means none is
selected, and the appliance then does not authenticate itself.

- **Values:** one of the configured certificates
