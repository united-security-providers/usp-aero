> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# CA Certificates

The certificate chains of the Certificate Authorities this Aero WAAP trusts. They are referenced wherever
a certificate presented by someone else has to be validated - the certificate a
[backend](../backends/tls) presents, and the certificate a client presents to a
[listener](../listeners/tls).

Uploading or removing a CA certificate here does not change anything by itself; it becomes effective
where it is selected.

## Upload Certificate {#upload-certificate}

Adds a CA certificate to the list. Drag the file into the upload field or choose it manually.

- **Values:** a certificate file in PEM or DER format

### Alias (optional) {#alias}

A name for the certificate in the list. Without one, the list identifies the certificate by its
subject, which is harder to scan.

- **Values:** free text
- **Default:** none

## Download CA Certificate {#download-certificate}

Downloads a certificate from the list in the format you choose.

- **Values:** `PEM`, `DER`, `PKCS #7`
