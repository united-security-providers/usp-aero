> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Health Check

## Active Health Check

### Active Health Check {#hcEnabled}

When enabled, backend endpoints are periodically checked for availability.

- **Values:** `on` or `off`
- **Default:** `off`

### Check Interval {#checkIntervalSec}

How often the check is performed.

- **Values:** a whole number of seconds, `0`–`99999`
- **Default:** none

### Request Timeout {#requestTimeoutSec}

How long to wait for a check to complete.

- **Values:** a whole number of seconds, `0`–`99999`
- **Default:** none

### Unhealthy Threshold {#unhealthyThreshold}

How many failed checks in a row mark an endpoint unhealthy.

- **Values:** a whole number of 1 or more
- **Default:** none

### Healthy Threshold {#healthyThreshold}

How many successful checks in a row mark an endpoint healthy again.

- **Values:** a whole number of 1 or more
- **Default:** none

### Select Health Check type {#type}

Chooses how availability is checked. With "TCP", availability is tested with just a simple TCP
connection check. With "HTTP", a URL and HTTP request method can be defined for a health check
request that will be sent to the backend, together with the HTTP status code expected to signal that
the backend is available (see below).

- **Values:** `TCP` or `HTTP`
- **Default:** `TCP`
- **Required:** yes

## HTTP settings

Shown when the health check type above is set to "HTTP".

### Hostname {#hostname}

The HTTP host requested during health checking. Uses the endpoint's address if not specified.

- **Values:** [IP address](../../value-types#ip-address) or [hostname](../../value-types#hostname)
- **Default:** none

### Path {#path}

The HTTP path requested during health checking.

- **Values:** text of at most 1024 characters
- **Default:** `/`
- **Required:** yes

### Method {#method}

The HTTP method used for the health check request.

- **Values:** `GET`, `HEAD` or `OPTIONS`
- **Default:** `GET`

### Expected Status code {#expectedStatusCode}

The HTTP response status considered healthy.

- **Values:** a whole number, `100`–`599`
- **Default:** `200`
