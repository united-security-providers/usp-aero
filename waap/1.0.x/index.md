> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# USP Aero WAAP

USP Aero WAAP (Web Application and API Protection) provides secure access to web-based applications and resources,
while simplifying the process of configuration and deployment.

It sits in front of the applications you publish and terminates the client connection: it accepts
the request, decides which application it belongs to, inspects it, applies the limits and restrictions
you configured, and only then forwards it to the application server. Responses pass back through the
same path, which is where the response headers a browser relies on are set.

Everything is configured in the management GUI and takes effect when you deploy a configuration
revision.

## Where to go next

* [Release Notes](aero-waap-releasenotes)
* Concepts: how a request is processed
* [Getting started](getting-started): publish a first web application, end to end
* Task-oriented guides:
  * Application integration: fitting Aero WAAP into an application's URLs, headers, cookies and TLS
  * Application protection: the rule engine, and the limits and restrictions that
    keep unwanted traffic away from the application
* [Reference](reference/): every screen and every setting of the management GUI

## Pages

- [Aero WAAP Release Notes](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/aero-waap-releasenotes/index.md)
- [How a request is processed](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/concepts/request-flow/index.md)
- [Detect-/Log-only mode](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/concepts/detect-only-mode/index.md)
- [Keeping the configuration documented](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/concepts/notes/index.md)
- [Getting started](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/getting-started/index.md)
- [Replace a certificate](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/tls/replace-a-certificate/index.md)
- [Automated certificate renewal (ACME)](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/tls/acme/index.md)
- [Client Certificate Validation (mTLS)](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/tls/mtls/index.md)
- [Backend TLS connections](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/tls/backend-tls/index.md)
- [Header manipulation](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/header-manipulation/index.md)
- [Cookie manipulation](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/cookie-manipulation/index.md)
- [Rewrite the request path](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/translation/index.md)
- [Redirect requests](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/application-integration/redirect/index.md)
- [OWASP Top 10](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/rule-engine/owasp-top-10/index.md)
- [Virtual patching](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/rule-engine/virtual-patch/index.md)
- [Handle a CRS false positive](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/rule-engine/handle-a-crs-false-positive/index.md)
- [(D)DoS protection](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/ddos-protection/index.md)
- [Header filtering](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/header-filtering/index.md)
- [IP restriction](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/ip-restrictions/index.md)
- [Limit request size](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/request-size-limit/index.md)
- [Repeat offender](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/repeat-offender/index.md)
- [Restrict HTTP Methods](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/limit-http-methods/index.md)
- [Security Headers](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/protection/security-headers/index.md)
- [Reference](https://docs.united-security-providers.ch/usp-aero/waap/1.0.x/reference/index.md)
