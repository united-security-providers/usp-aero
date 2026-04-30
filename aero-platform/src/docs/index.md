# USP Aero Platform

The USP Aero Platform is based on Fedora CoreOS and provides a flexible, extensible container-based environment for 
running several security-related components and services.

It allows to install different versions / releases of different security components as the need arises,
independent of which release was originally installed.

![Console window during boot / setup](./assets/images/Conceptual_Architecture_Aero.png)

* Ease-of-use: The platform allows an easy setup and regular (automated) updates to ensure a low cost of operations but also ensures to keep up to date with software components and allows to fix vulnerabilities in an efficient and timely manner.
* Ease-of-Integration: Todays security components must be integrated in the overall IT system, like IDM, SIEM, etc. 
  Therefore, the Aero Platform allows for easy integration with systems like AD/LDAP or OIDC OP for management access, 
  SIEM for Log analysis, Prometheus etc. for monitoring.
* Versatility and extensibility: The Aero platform can be seamlessly extended with several component (WAAP reverse proxy, WAAP Authenticate, ***TODO*** ) and future component that will provide new functionality.
