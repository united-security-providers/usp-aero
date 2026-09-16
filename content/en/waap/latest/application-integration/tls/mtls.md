---
title: "Client Certificate Validation (mTLS)"
weight: 50
---

# Client Certificate Validation (mTLS)

Normally only WAAP proves its identity to the client, by presenting the virtual host's server certificate.
With client certificate validation the connecting client has to prove its identity too: WAAP asks for a
certificate and rejects the connection unless it was issued by a CA you trust.

This is the client leg of the connection. For the certificate WAAP presents when it connects onwards
to your application server, see [Backend TLS connections](backend-tls) - the two are independent and
easy to confuse.

> [!IMPORTANT]
> The setting lives on the **listener**, so it applies to every virtual host that shares that listener.
> You cannot require a client certificate for one application and leave another one open if both sit
> on the same listener; give them separate listeners when their requirements differ.

## Require a certificate from the client

1. Open the listener and go to its [TLS](../../reference/gui/listeners/tls) tab.
2. Turn on "Client Certificate Validation (mTLS)".
3. Select a [Trusted CA Certificate](../../reference/gui/certificates/ca-certificates) - the CA that
   issued the client certificates you intend to accept. Upload it beforehand if it is not in the
   list yet.
4. Decide whether a certificate is mandatory. Leave "Optional validation" off to require one; turn
   it on to keep accepting connections that present none, which is useful while clients are still
   being rolled out.
5. Turn on "Forward Client Certificate information with XFCC HTTP Header" if the application behind
   WAAP needs to know which client it was.
6. [Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle).

## Accept only specific certificates

Trusting a CA means accepting every certificate that CA has issued. Where that is too broad, add a
SAN Match to narrow it to particular identities:

1. On the same tab, add a SAN Match.
2. Choose the Type - `Email` matches the certificate's email SAN, `Other Names` matches another SAN
   entry and additionally needs an OID identifying which one.
3. Choose the Matcher - `Exact`, `Prefix`, `Suffix` or `Regex` - and enter the Value to compare
   against.

> [!TIP]
> Requiring a certificate with no SAN Match accepts any client the CA has ever issued a certificate to.

## Related

- [TLS](../../reference/gui/listeners/tls) - every field of the listener's TLS tab
- [CA Certificates](../../reference/gui/certificates/ca-certificates) - the trust store
- [Backend TLS connections](backend-tls) - the other leg of the connection
