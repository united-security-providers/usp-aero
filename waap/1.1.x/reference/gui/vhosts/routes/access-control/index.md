> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Access Control

Restricts which client addresses may reach this route. The check runs before the request is
forwarded, so a blocked request never reaches the backend. Each route has its own rules.

## IP Access Control {#enabled}

Turns the restriction on and off. While it is off, every address reaches the route. Turning it off
also clears the access mode and the rules you have entered.

- **Values:** `on` or `off`
- **Default:** `off`

## Access Mode {#accessMode}

What happens to a request whose address matches none of the rules.

- `Allow only listed IPs` - everything is blocked except the addresses listed below. Use it when a
  known set of clients is the only legitimate source of traffic.
- `Block listed IPs` - everything is allowed except the addresses listed below. Use it to shut out
  specific sources while the route stays open.

Selecting `Allow only listed IPs` and leaving the rules empty blocks every request to the route.
The screen requires at least one rule while access control is on.

- **Values:** `Allow only listed IPs`, `Block listed IPs`
- **Default:** none
- **Required:** yes

## Rules {#rules}

The addresses the access mode applies to. Add one with the **+** button; at least one is required.

### Type {#type}

Whether the rule matches one address or a whole network.

- **Values:** `Single IP`, `CIDR Range`
- **Required:** yes

### Value {#value}

The address the rule matches.

- **Values:** an [IP address](../../../value-types#ip-address) for `Single IP`, a
  [CIDR range](../../../value-types#cidr) such as `10.0.0.0/8` for `CIDR Range`
- **Required:** yes

### Label {#label}

A short name identifying the rule in the list.

- **Values:** free text
- **Required:** yes
