---
title: "Log Forwarding"
weight: 35
---

# Forward logs to remote System

The appliance can forward its log data to a central log server, such as a SIEM, over Syslog or
OpenTelemetry. Logs stay available on the appliance as well - see [Live Log](live-log).

## Prepare the certificates

Skip this section if the log server accepts unencrypted connections and you accept sending log data
in the clear.

Forwarding over TLS validates the log server's certificate, and some log servers additionally
require the client to authenticate. Upload what you need before configuring the target, under
[Configuration → Certificates](../reference/gui/configuration/certificates):

- the CA certificate that issued the log server's certificate, as a CA certificate,
- and, for mutual TLS, the certificate and key this appliance authenticates with.

## Configure the target

1. Open [Configuration → Logs](../reference/gui/configuration/log) and turn on "Remote Log".
2. Enter the hostname and port of the log server.
3. Choose the log protocol the server expects, `Syslog` or `OpenTelemetry`.
4. Turn on "TLS" and select the trusted CA certificate, and the client certificate if the server
   requires mutual TLS.
5. [Create a revision and deploy it](../concepts/configuration-lifecycle) to start forwarding.

One log server can be configured. Where logs have to reach several systems, forward them to one
collector and fan them out from there.

## Verify

After the deployment, confirm on the log server that entries from this appliance are arriving. If
nothing shows up, check in this order: that the deployment finished, that the appliance can reach
the log server's host and port, and that the protocol matches what the server expects. TLS problems
usually mean the trusted CA certificate does not match the certificate the server presents; the
"Disable Server Certificate validation" switch will confirm that suspicion, but leave it off in
production.
