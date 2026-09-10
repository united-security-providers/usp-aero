---
title: "Certificates"
weight: 50
---

# Certificates

## Tab "Management Access"

Configure the server certificate of the administration UI.

### Select "Active Certificate"

Select a server certificate from the list of certificates added in the "Available Certificates"
section below.

### Automatic Certificate renewal (ACME)

Use this option to instead have the server certificate be generated and renewed automatically using
the ACME protocol.

### Section "Available Certificates"

Click the "+" icon to either upload a certificate or create a self-signed one. Click the "trashcan"
icon in order to delete a certificate.

## Tab "CA Certificates"

Click the "+" icon to upload CA certificates of trusted certificate authorities. These certificates
can then be selected in various other configuration screens.

When uploading a CA certificate, an "Alias" must be defined. This alias will be shown as a label in
other configuration screens.
