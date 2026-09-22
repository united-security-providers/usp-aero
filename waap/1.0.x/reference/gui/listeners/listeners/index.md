> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Listeners

Configure the HTTP listeners. A listener accepts incoming connections on an IP address and port;
see [How a request is processed](../../../concepts/request-flow) for how it relates to virtual hosts,
routes and backends.

## List of listeners

### Name {#name-column}

The listener's name.

- **Values:** text

### IPv4 Address {#ipv4-column}

The listener's IPv4 address.

- **Values:** [IP address](../../value-types#ip-address)

### IPv6 Address {#ipv6-column}

The listener's IPv6 address.

- **Values:** [IP address](../../value-types#ip-address)

### HTTP Port {#httpPort-column}

The listener's plain HTTP port.

- **Values:** [port](../../value-types#port)

### HTTPS Port {#httpsPort-column}

The listener's HTTPS port.

- **Values:** [port](../../value-types#port)

### mTLS {#tls}

Whether client certificate validation (mTLS) is configured on the listener's [TLS tab](tls).

### Actions {#action}

Open a listener's details ("Edit" or, in read-only mode, "Details"), or delete it. Deleting a
listener is not possible while it still has virtual hosts assigned to it.

### Add Listener {#addListenerButton}

Creates a new listener.

## Tab "Settings"

The Settings tab lets you define the listener's general settings and shows its assigned virtual
hosts.

### Name {#name}

A label for the listener, used to reference it in other configuration screens.

- **Values:** text of at most 253 characters, written as one or more dot-separated labels of letters,
  digits, spaces and hyphens
- **Required:** yes

At least one of IPv4 or IPv6 must be set.

### IPv4 {#ipv4}

The IPv4 address the listener binds to, chosen from the addresses available on the appliance. When
creating a new listener, this is pre-filled with the appliance's first available IPv4 address.

- **Values:** [IP address](../../value-types#ip-address), or not defined
- **Default:** none

### IPv6 {#ipv6}

The IPv6 address the listener binds to, chosen from the addresses available on the appliance. Only
shown when IPv6 support is enabled. When creating a new listener, this is pre-filled with the
appliance's first available IPv6 address.

- **Values:** [IP address](../../value-types#ip-address), or not defined
- **Default:** none

### HTTP Port {#httpPort}

The port the listener accepts plain HTTP connections on. Combined with the IP addresses above, the
port must be unique among listeners.

- **Values:** [port](../../value-types#port)
- **Default:** `80`
- **Required:** yes

### HTTPS Port {#httpsPort}

The port the listener accepts HTTPS connections on. Combined with the IP addresses above, the port
must be unique among listeners.

- **Values:** [port](../../value-types#port)
- **Default:** `443`
- **Required:** yes

### Overwrite Server header {#overwriteServerHeader}

Allows to set or overwrite the value of the HTTP `Server` response header sent by this listener.

- **Values:** `on` or `off`
- **Default:** `off`

### Custom Server header {#customServerHeader}

The value sent as the `Server` HTTP response header. When "Overwrite Server header" is switched on,
this defaults to `AeroWAAP`.

- **Values:** text of at most 4096 characters
- **Default:** none

### Header based Client IP detection {#headerBasedClientIpDetection}

Configures how the client's real IP address is determined when the listener is reached through a
trusted proxy chain, using either the `X-Forwarded-For` header or a custom header.

- **Values:** `on` or `off`
- **Default:** `off`

### Client IP Detection Mode {#clientIpDetectionMode}

Chooses which HTTP header carries the client's real IP address: the standard `X-Forwarded-For`
header, using the configured number of trusted hops, or a custom header name.

- **Values:** `X-Forwarded For` or `Custom Header`
- **Default:** `X-Forwarded For`

### Number of trusted hops {#numberOfTrustedHops}

The number of trusted proxy hops to count back from in the `X-Forwarded-For` header to find the
client's real IP address.

- **Values:** a whole number of 0 or more
- **Default:** none
- **Required:** yes, when "X-Forwarded For" is selected above

### Header Name {#customHeaderName}

The name of the HTTP header that carries the client's real IP address.

- **Values:** text of at most 4096 characters
- **Default:** none
- **Required:** yes, when "Custom Header" is selected above

### Assigned virtual hosts {#assigned-vhosts}

Shows the virtual hosts currently assigned to this listener, and lets you add another one. Virtual
hosts can only be added once the listener itself has been created; see
[Virtual Hosts](../vhosts/virtual-hosts).
