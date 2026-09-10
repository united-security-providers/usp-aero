---
title: "Replace a certificate"
weight: 20
---

# Replace a certificate

1. Open [Certificates & Keys](../reference/certificates/certificates-and-keys) and upload the new certificate
   (and key), or create a new self-signed certificate or CSR. Give it its own name.
2. Open the [virtual host](../reference/vhosts/virtual-hosts) that uses the old certificate and select the new
   one in its **Certificate** field.
3. [Create a revision and deploy it](../../../platform/latest/concepts/configuration-lifecycle) to
   activate the change.
