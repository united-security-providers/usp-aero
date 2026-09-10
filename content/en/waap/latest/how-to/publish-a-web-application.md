---
title: "Publish a web application"
weight: 10
---

# Publish a web application

This walks through the end-to-end path to expose a web application through Aero WAAP. See
[How a request is processed](../concepts/request-flow) for how these objects relate to each other.

1. **Create a listener.** Open [Listeners](../reference/listeners/listeners) and add one with the HTTP/HTTPS
   ports and IP address to accept traffic on.
2. **Upload or create a certificate.** Open
   [Certificates & Keys](../reference/certificates/certificates-and-keys) and upload a certificate, or create a
   self-signed one or a CSR, for the application's hostname.
3. **Create a virtual host.** Open [Virtual Hosts](../reference/vhosts/virtual-hosts), select the listener from
   step 1, add the application's hostname(s), and select the certificate from step 2.
4. **Create a backend.** Open [Backends](../reference/backends/backends) and add the application's server
   endpoint(s).
5. **Add a route.** On the virtual host, add a [route](../reference/vhosts/routes/routes) with a path matcher
   and select the backend from step 4.
6. **Create a revision and deploy it.** Go to the platform's
   [Configuration lifecycle](../../../platform/latest/concepts/configuration-lifecycle), create a
   revision, and deploy it to activate the configuration.
