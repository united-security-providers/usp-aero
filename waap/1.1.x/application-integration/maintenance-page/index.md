> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Show a maintenance page

A maintenance page answers requests to selected routes of a virtual host directly from Aero WAAP,
for example while the backend application is being updated. The requests are not forwarded to the
backend.

## Show a maintenance page on a virtual host

1. Under *Local Files > [Maintenance Pages](../reference/gui/local-files/maintenance-pages)*, create
   or upload the page. Choose the [Content Type](../reference/gui/local-files/maintenance-pages#contentType)
   that matches the content, for example `text/html`.
2. Open the [virtual host](../reference/gui/vhosts/virtual-hosts) and go to the
   [Error Pages & Maintenance Pages](../reference/gui/vhosts/error-pages#maintenance-pages) tab.
3. In the *Maintenance Pages* section, select the
   [Maintenance Page](../reference/gui/vhosts/error-pages#localMaintenancePageId).
4. Select the [Routes](../reference/gui/vhosts/error-pages#routeIds) to put into maintenance, or turn
   on [All routes](../reference/gui/vhosts/error-pages#allRoutes) to cover every route of the virtual
   host, including routes added later.
5. Optionally change the [Status Code](../reference/gui/vhosts/error-pages#statusCode). The default
   `503` (Service Unavailable) tells clients and search engines that the outage is temporary.
6. Turn the [Active](../reference/gui/vhosts/error-pages#maintenancePageEnabled) toggle on and save.
7. [Create a revision and deploy it](../../../platform/1.1.x/concepts/configuration-lifecycle) to
   apply the change.

> [!NOTE]
> On routes with an active maintenance page, the virtual host's
> [error pages](../reference/gui/vhosts/error-pages#error-pages) are not served.

## End the maintenance

1. Turn the [Active](../reference/gui/vhosts/error-pages#maintenancePageEnabled) toggle off and save.
   The selected page and routes are kept for the next maintenance.
2. [Create a revision and deploy it](../../../platform/1.1.x/concepts/configuration-lifecycle).

## Related

- [Error Pages & Maintenance Pages](../reference/gui/vhosts/error-pages): all fields of the tab
- [Maintenance Pages](../reference/gui/local-files/maintenance-pages): managing the page files
