> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Getting started

## Install "WAAP" component

Before you can start the configuration you will need to [install](../../platform/1.0.x/operations/components/install-a-component)
the "WAAP" component.

> [!IMPORTANT]
> The "WAAP" component requires that the "External" network role is configured with at least one IP address!

1. In the platform GUI, open [Components](../../platform/1.0.x/reference/gui/components) and click "Add Component"
2. In the visible pop-up, select the "WAAP", and click "Add"
3. As soon as the installation is complete, you will find the new icon in the module switcher navigation bar.
   Select it to get to the Aero WAAP configuration view.

## Publish a web application

This walks through the end-to-end path to expose a web application through Aero WAAP. See
[How a request is processed](concepts/request-flow) for how these objects relate to each other.

1. **Create a listener.** Open [Listeners](reference/gui/listeners/listeners) and add one with the HTTP/HTTPS
   ports and IP address to accept traffic on.
2. **Upload or create a certificate.** Open
   [Certificates & Keys](reference/gui/certificates/certificates-and-keys) and upload a certificate, or create a
   self-signed one or a CSR, for the application's hostname.
3. **Create a virtual host.** Open [Virtual Hosts](reference/gui/vhosts/virtual-hosts), select the listener from
   step 1, add the application's hostname(s), and select the certificate from step 2.
4. **Create a backend.** Open [Backends](reference/gui/backends/backends) and add the application's server
   endpoint(s).
5. **Add a route.** On the virtual host, add a [route](reference/gui/vhosts/routes/routes) with a path matcher
   and select the backend from step 4.
6. **Create a revision and deploy it.** Go to the platform's
   [Configuration lifecycle](../../platform/1.0.x/concepts/configuration-lifecycle), create a
   revision, and deploy it to activate the configuration.
