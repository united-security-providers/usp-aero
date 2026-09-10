---
title: "Rule Engine"
weight: 30
---

# Rule Engine

## Request / Response

Select either one to define rules to be applied either to incoming requests or to outgoing
responses.

### Body access

Enable this to allow the filter to access the request or response body.

### Body size limit

The maximum size of the request or response body, in number of bytes.

### Body size limit behavior

Defines if a request or response should be rejected or accepted if the body size exceeds the
specified limit.

### Body Parsing

Allows to enable JSON and / or XML parsing of the request or response body content. In case of JSON,
it is also possible to validate the JSON structure.

### Debug Log Level

Sets the debug log level for the rule engine.

## Core Rule Set

### Mode

Configures the behavior of the Coraza security filter:

- **Disabled** - The Coraza filter is disabled entirely and will not scan anything.
- **Detecting** - The request or response content is scanned and detected issues are logged, but
  nothing is blocked.
- **Enforcing** - The request or response content is scanned and, in case of detected issues, the
  request or response will be blocked.

### Paranoia Level

Configures the CRS paranoia level: the higher the level, the more rules are evaluated, at the cost of
a higher rate of false positives.

### Security Level

Configures the Coraza security level, either "Loose" or "Tight".

### Request / Response attack categories

Enable or disable specific rule sets for certain types of vulnerabilities using the corresponding
switch. This can again be done for requests and responses separately, for categories such as SQL
Injection, Cross Site Scripting (XSS), Protocol Enforcement, Protocol Attack, Scanner Detection,
Session Fixation, Remote Code Execution, Remote/Local File Inclusion, and several data-leakage and
application-specific attack categories (PHP, Java, IIS, Ruby).

### Rule exceptions

Exceptions for CRS rules can be defined to mitigate false positives, i.e. valid, legitimate requests
or responses being blocked because they get flagged as malicious (which is more likely to happen the
higher the selected paranoia level is). To create a rule exception, click the "+" icon. In the
following pop-up dialog, the following elements must be specified:

- **Rules** - The rule set, or rule, for which to create the exception.
- **Request Part** - The part of the request to which the exception applies, such as body or
  headers.
- **Path** - The URI path for which the exception must be used. A regular expression matcher can be
  enabled for the URI path.

## Custom rules

In addition to the existing CRS rule sets, custom rules can be defined:

### Name

The name of the rule.

### Rule

The rule expression to evaluate.

### Before CRS

If switched on, this custom rule will be applied before the CRS rule sets. Otherwise, the CRS rules
will be evaluated first.
