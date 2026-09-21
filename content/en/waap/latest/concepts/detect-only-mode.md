---
title: "Detect-only mode"
weight: 20
---

# Detect-/Log-only mode

Integrating a new application and protecting it with Aero WAAP, often requires tuning
and configuration adjustment so that the application works as expected.

To ease this step, known features that are likely to interrupt legit traffic without proper
alignment offer a detect- or log-only mode. In these modes, Aero WAAP scans requests and responses
for attacks and flags anything that matches the configured feature set, but will not trigger a
disruptive action like blocking the request or altering the request/response like header removal.

> [!IMPORTANT]
> Production setups should never run in detect or log-only mode! It's advised to use these modes
> in a test or development environment and disable it when moving to production.

## Rolling out an application safely

### Phase 1 - Log only
1. When starting fresh with a new application:
   * Set the virtual host's Core Rule Set mode of the rule engine to `Detect`
   * Enable the route's header filter `Log Only` mode
2. Deploy the configuration, and watch the logged matches for the traffic the application actually produces.
3. For matches that turn out to be legitimate traffic, [add a rule exception](../protection/rule-engine/handle-a-crs-false-positive),
   or add additional allowed headers etc. until no new violations are logged.

### Phase 2 - Enable protection mechanism
1. Once the remaining matches are genuine attacks:
    * switch Core Rule Set mode to `Block`
    * disable the route's header filter `Log Only` mode
2. Additionally, you should set the Core Rule Sets' `Security Level` to `2`. This will not block every rule violation directly
   and allows you to tune the rule engine further with real traffic, without the risk that requests are blocked immediately.
3. Deploy the configuration, and proceed in the same way as in phase 1 with tuning the configuration.

### Phase 3 - Strict blocking
1. Once sufficient certainty has been established, that all legit traffic is not blocked,
   gradually increase the `Security Level` up to `5`. This ensures that every rule violation is blocked.

## Related

- [Rule Engine](../reference/gui/vhosts/rule-engine): Mode, paranoia levels, security level and rule
  exceptions
- [Handle a CRS false positive](../protection/rule-engine/handle-a-crs-false-positive): adding an
  exception instead of disabling protection
- [Headers](../reference/gui/vhosts/routes/headers)
- [Header filtering](../protection/header-filtering)
