> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Replace a certificate

1. Open [Certificates & Keys](../../reference/gui/certificates/certificates-and-keys) and upload the new certificate
   (and key), or create a new self-signed certificate or CSR. Give it its own name.
2. Open the [virtual host](../../reference/gui/vhosts/virtual-hosts) that uses the old certificate and select the new
   one in its **Certificate** field.
3. [Create a revision and deploy it](../../../../platform/1.0.x/concepts/configuration-lifecycle) to
   activate the change.
