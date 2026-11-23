> For AI agents: this documentation is indexed at https://docs.united-security-providers.ch/usp-aero/llms.txt, and every page is available as markdown at its own address plus index.md.

# Live Log

Live Log shows the log output of the appliance as it happens. Use it while
making a change, or as the first stop when something does not behave as expected.

Live Log is meant for looking at what is happening now. For keeping logs beyond the appliance, for
searching across a longer period, or for feeding a SIEM, forward them to a central log server
instead. See [Forward logs to a remote system](remote-log) for more details.

The container logs are logically grouped by component. It's possible to view the whole group or each
container individually.

| Group    | View            | Shows                                                                                      |
|----------|-----------------|--------------------------------------------------------------------------------------------|
| Platform | System          | The system log of the appliance.                                                           |
| Platform | Deployment Run  | The output of the last deployment run. It is not forwarded to remote log targets.          |
| Platform | Remote Log      | The log forwarder. Only shown when at least one [remote log target](remote-log) is set up. |
| WAAP     | WAAP-Proxy      | The WAAP gateway. The WAAP group is only shown when WAAP has listeners configured.         |
| WAAP     | WAAP-Ext-Server | The WAAP extension server.                                                                 |

Log-Search, -filter and -download options are revealed in the menu located behind the red and blue dots.
