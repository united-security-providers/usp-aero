---
title: "Automated certificate renewal (ACME)"
weight: 30
---

# Automated certificate renewal (ACME)

Instead of uploading and renewing a certificate by hand, a virtual host can obtain and renew its
server certificate automatically from an ACME provider such as a public or internal certificate
authority.

1. Open Certificates, go to [ACME providers](../../reference/gui/certificates/acme) and choose "Create
   ACME Provider".
2. Enter a Name and the Certificate Authority URL of the provider's ACME endpoint.
3. If the provider's own certificate chain is not publicly trusted - typical for an internal CA -
   select it as a [Trusted CA Certificate](../../reference/gui/certificates/ca-certificates), or, for
   testing only, turn on "Skip Certificate Validation".
4. Enter the Email address the provider should use for warnings, and choose the Key Type.
5. If your provider requires External Account Binding, enter the Key ID and HMAC Key it gave you.
   Leave both empty if it does not.
6. Save the provider.
7. On the [virtual host](../../reference/gui/vhosts/virtual-hosts)'s Settings tab, open the Certificate
   list and select the provider you just created - it is listed alongside the uploaded certificates,
   suffixed "(ACME)".

[Create a revision and deploy it](../../../../platform/latest/concepts/configuration-lifecycle)

After deployment, the virtual host requests and renews its certificate from the provider automatically from then on.
Until the first certificates is issued by the CA, a temporary self-signed certificate is issue to spin up the virtual host.

## Related

- [ACME providers](../../reference/gui/certificates/acme) - all provider fields
- [Virtual Hosts](../../reference/gui/vhosts/virtual-hosts) - selecting a certificate or an ACME provider
- [CA Certificates](../../reference/gui/certificates/ca-certificates) - trusting a private ACME provider
- [Replace a certificate](replace-a-certificate) - the manual alternative
