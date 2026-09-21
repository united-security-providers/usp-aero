---
title: "Welcome"
---

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
