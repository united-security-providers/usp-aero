> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Backend TLS connections

Aero WAAP terminates the client's TLS connection and opens its own connection to the application server.
That second leg is configured separately on the backend, and it is encrypted only if you say so.
Terminating TLS at Aero WAAP does not by itself protect the traffic between Aero WAAP and your application.

This page is about that second leg. For the certificate a *client* has to present to Aero WAAP, see
[Client Certificate Validation (mTLS)](mtls) The two are independent and easy to confuse.

## Encrypt the connection to the backend

1. Open the backend and go to its [TLS](../../reference/gui/backends/tls) tab.
2. Turn on "TLS Connection".
3. Select a [Trusted CA Certificate](../../reference/gui/certificates/ca-certificates).
   The selected CA must match the CA that will issue the backend's own server certificate
   so that Aero WAAP can verify it is talking to the right server.
4. Set an "SNI Hostname" if the backend serves several hostnames on the same address and needs to be
   told which one is meant.
5. [Create a revision and deploy it](../../../../platform/1.0.x/concepts/configuration-lifecycle).

> [!CAUTION]
> "Skip Certificate Validation" turns the check in step 3 off. It gets a connection working quickly
> against a server with a self-signed certificate, but it also accepts any certificate at all, which
> removes the protection against talking to the wrong server. This should be avoided in production.

## Authenticate Aero WAAP to the backend

Where the application server only accepts callers that identify themselves, Aero WAAP can present a
certificate of its own:

1. On the same tab, select the certificate under "Client Authentication".
2. Install the matching CA certificate on the application server so it can validate what Aero WAAP
   presents.
3. [Create a revision and deploy it](../../../../platform/1.0.x/concepts/configuration-lifecycle).

This makes Aero WAAP the client in that exchange, the mirror image of
[Client Certificate Validation (mTLS)](mtls), where Aero WAAP is the server checking someone else.

## Related

- [TLS](../../reference/gui/backends/tls): every field of the backend's TLS tab
- [CA Certificates](../../reference/gui/certificates/ca-certificates): the trust store used on both legs
- [Client Certificate Validation (mTLS)](mtls): the client leg
