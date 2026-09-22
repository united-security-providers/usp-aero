> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Rule Engine

Scans incoming requests and outgoing responses for attacks using a Core Rule Set, with separate
settings for the request and the response direction, plus custom rules written in SecLang.

## Rule Engine

### Request Body Processing

#### Parse JSON {#parseJson}

Enables JSON parsing of the request body, so that the rule engine can inspect its structure.

- **Values:** `on` or `off`
- **Default:** `off`

#### Parse XML {#parseXml}

Enables XML parsing of the request body, so that the rule engine can inspect its structure.

- **Values:** `on` or `off`
- **Default:** `off`

#### Validate Body - fail on body parsing issues {#validateBody}

When enabled, a request whose body fails JSON or XML parsing is blocked instead of being passed
through unparsed.

- **Values:** `on` or `off`
- **Default:** `off`

### Request Body Processing

#### Body Access {#bodyAccess}

Allows the rule engine to access the response body. Turning this on reveals the body size limit
below.

- **Values:** `on` or `off`
- **Default:** `off`

#### Body Size Limit {#bodySizeLimit}

The maximum size of the response body that will be inspected.

- **Values:** a number followed by a unit - `B`, `KB`, `MB`, `GB` or `TB` (e.g. `10MB`) - from 1 byte
  up to 1 GB
- **Default:** none

### Debug Log Level {#debugLogLevel}

Sets the debug log level for the rule engine.

- **Values:** a whole number from `0` to `9`
- **Default:** `0`

## Core Rule Set (CRS)

### Mode {#coreRuleSetMode}

Configures the behavior of the CRS rules:

- `Disabled` - the CRS rules are disabled entirely.
- `Detect` - the request or response content is scanned and detected issues are logged, but nothing
  is blocked.
- `Block` - the request or response content is scanned and, in case of detected issues, the request
  or response will be blocked.

- **Values:** `Disabled`, `Detect`, `Block`
- **Default:** `Block`

### Paranoia Level {#paranoiaLevel}

Each rule category is split in up to 4 paranoia levels. The higher the level the more rules are applied,
making it more difficult for an attacker. But also it's more likely to produce false positives resulting
in a higher tuning effort! 

| Paranoia Level | Description                                                                                |
|----------------|--------------------------------------------------------------------------------------------|
| `1`(default)   | Baseline applicable to all services                                                        |
| `2`            | Extended baseline for application handling a lot of user inputs. Tuneing will be required. |
| `3`            | High security requirement, similar to Online banking. Expect many false positives!         |
| `4`            | Highest security requirement for the cost of tuning a tremendous amount of false positive  |

#### Enforcing {#paranoiaLevelEnforcing}

The Core Rule Set paranoia level applied while in `Block` mode.

- **Values:** `1`, `2`, `3`, `4`
- **Default:** `1`

#### Detecting {#paranoiaLevelDetecting}

The Core Rule Set paranoia level applied but not counted towards the block anomaly score.
This allows to increase the paranoia level in production operation without risking blocks due
to false positives and without the need to lower the security level.

- **Values:** `1`, `2`, `3`, `4`
- **Default:** `1`

### Security Level {#securityLevel}

Configures the rule engine's security level on a sliding scale from Loose to Tight.

Every Core Rule Set rule that matches adds points to the request's or response's 
[anomaly score](https://coreruleset.org/docs/2-how-crs-works/2-1-anomaly_scoring/). The security level
sets the score at which that request or response is blocked: reaching the threshold is enough, the
score does not have to exceed it. A lower level tolerates more findings before it acts.

| Security Level | Request threshold | Response threshold | Critical rule match |
|----------------|-------------------|--------------------|---------------------|
| `1` (Loose)    | 50                | 40                 | 10                  |
| `2`            | 25                | 20                 | 5                   |
| `3`            | 15                | 12                 | 3                   |
| `4` (default)  | 10                | 8                  | 2                   |
| `5` (Tight)    | 5                 | 4                  | 1                   |

A rule of critical severity contributes 5 points to the request score and 4 to the response score, so
the last column is the number of critical findings a request or response may collect before it is
blocked. Rules of lower severity contribute fewer points, and several of them can add up to the same
threshold.

The thresholds do not change with the Mode: in `Detect` mode the score is still counted against them
and a crossing is logged, but nothing is blocked.

- **Values:** a whole number from `1` (Loose) to `5` (Tight)
- **Default:** `4`

### Request categories

The following options enable or disable Core Rule Set detection for specific request
attack categories.

#### Scanner Detection {#scannerDetection}

Detects requests originating from vulnerability scanners.

- **Values:** `on` or `off`
- **Default:** `on`

#### Protocol Enforcement {#protocolEnforcement}

Enforces conformance with the HTTP protocol.

- **Values:** `on` or `off`
- **Default:** `on`

#### Protocol Attack {#protocolAttack}

Detects HTTP protocol-level attacks, such as request smuggling or header injection.

- **Values:** `on` or `off`
- **Default:** `on`

#### Multipart Attack {#multipartAttack}

Detects attacks against multipart/form-data request bodies.

- **Values:** `on` or `off`
- **Default:** `on`

#### Local File Inclusion Attack {#localFileInclusionAttack}

Detects attempts to include local files.

- **Values:** `on` or `off`
- **Default:** `on`

#### Remote File Inclusion Attack {#remoteFileInclusionAttack}

Detects attempts to include remote files.

- **Values:** `on` or `off`
- **Default:** `on`

#### Remote Code Execution Attack {#remoteCodeExecutionAttack}

Detects attempts to execute code remotely.

- **Values:** `on` or `off`
- **Default:** `on`

#### PHP Application Attack {#phpApplicationAttack}

Detects attacks specific to PHP applications.

- **Values:** `on` or `off`
- **Default:** `on`

#### Generic Application Attack {#genericApplicationAttack}

Detects generic application-layer attacks not specific to a particular technology.

- **Values:** `on` or `off`
- **Default:** `on`

#### Cross Site Scripting (XSS) Attack {#crossSiteScriptingAttack}

Detects cross-site scripting attacks.

- **Values:** `on` or `off`
- **Default:** `on`

#### SQL Injection Attack {#sqlInjectionAttack}

Detects SQL injection attacks.

- **Values:** `on` or `off`
- **Default:** `on`

#### Session Fixation Attack {#sessionFixationAttack}

Detects session fixation attacks.

- **Values:** `on` or `off`
- **Default:** `on`

#### Java Application Attack {#javaApplicationAttack}

Detects attacks specific to Java applications.

- **Values:** `on` or `off`
- **Default:** `on`


### Request Rule Exceptions

Exceptions for Core Rule Set rules can be defined to mitigate false
positives, i.e. valid, legitimate requests being blocked because they get flagged as malicious (which
is more likely to happen the higher the selected paranoia level is). To create a rule exception,
click the "+" icon.

#### Rules {#ruleId}

The rule set, or individual rule, for which to create the exception.

- **Values:** one of the request-phase Core Rule Set categories or rules
- **Required:** yes

#### Request Part {#requestPart}

The part of the request the exception applies to. Only offered when the selected rule has a fixed
set of targets to choose from.

- **Values:** one of the request parts defined by the selected rule
- **Default:** none

#### Request Part Name {#requestPartName}

The specific name within the selected request part the exception applies to (e.g. a header name when
the request part is request headers). Only shown for request parts that take a name.

- **Values:** free text
- **Default:** none

#### Path {#path}

The URI path for which the exception must be used.

- **Values:** free text
- **Default:** none

#### Regular Expression matcher for Path {#regExMatcherForPath}

Enables a regular expression matcher for the path above, instead of matching it literally.

- **Values:** `on` or `off`
- **Default:** `off`

#### Comment {#comments-request-exception}

Free-text notes stored with the rule exception. They have no effect on request processing.

- **Values:** free text
- **Default:** none


### Response categories
The following options enable or disable Core Rule Set detection for specific response
attack categories.

#### General Data Leakage {#generalDataLeakage}

Detects generic sensitive-data leakage in responses.

- **Values:** `on` or `off`
- **Default:** `off`

#### SQL Data Leakage {#sqlDataLeakage}

Detects SQL-related data leakage in responses.

- **Values:** `on` or `off`
- **Default:** `off`

#### Java Data Leakage {#javaDataLeakage}

Detects Java-related data leakage in responses, such as stack traces.

- **Values:** `on` or `off`
- **Default:** `off`

#### PHP Data Leakage {#phpDataLeakage}

Detects PHP-related data leakage in responses.

- **Values:** `on` or `off`
- **Default:** `off`

#### IIS Data Leakage {#iisDataLeakage}

Detects IIS-related data leakage in responses.

- **Values:** `on` or `off`
- **Default:** `off`

#### Web Shells Detection {#webShellsDetection}

Detects signs of a web shell in responses.

- **Values:** `on` or `off`
- **Default:** `off`

#### Ruby Data Leakage {#rubyDataLeakage}

Detects Ruby-related data leakage in responses.

- **Values:** `on` or `off`
- **Default:** `off`

### Response Rule Exceptions

Exceptions for Core Rule Set rules applied to the response, defined
the same way as request rule exceptions.

#### Rules {#ruleId-response}

The rule set, or individual rule, for which to create the exception.

- **Values:** one of the response-phase Core Rule Set categories or rules
- **Required:** yes

#### Path {#path-response}

The URI path for which the exception must be used.

- **Values:** free text
- **Default:** none

#### Regular Expression matcher for Path {#regExMatcherForPath-response}

Enables a regular expression matcher for the path above, instead of matching it literally.

- **Values:** `on` or `off`
- **Default:** `off`

#### Comment {#comments-response-exception}

Free-text notes stored with the rule exception. They have no effect on request processing.

- **Values:** free text
- **Default:** none

## Custom Rules

In addition to the Core Rule Set, custom rules written in SecLang can be defined. Click the "+" icon
to add one.

### Name {#name}

The name of the rule.

- **Values:** free text
- **Required:** yes

### Rule {#rule}

The rule expression to evaluate, written in SecLang.

- **Values:** free text
- **Required:** yes

### Before CRS {#placeBeforeCoreRuleSet}

If switched on, this custom rule will be applied before the Core Rule Set. Otherwise, the Core Rule
Set is evaluated first.

- **Values:** `on` or `off`
- **Default:** `off`

### Comment {#comments-custom-rule}

Free-text notes stored with the custom rule. They have no effect on request processing.

- **Values:** free text
- **Default:** none

### Last Edited {#lastEdited-column}

When the rule was last saved. Set automatically; not editable.
